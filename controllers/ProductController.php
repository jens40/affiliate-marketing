<?php

namespace app\controllers;

use Yii;
use app\models\Products;
use app\models\ProductSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\filters\AccessControl;
use app\components\UserIdentity;
use app\components\AccessRule;

/**
 * ProductController implements the CRUD actions for Products model.
 */
class ProductController extends Controller {

    /**
     * {@inheritdoc}
     */
    public function behaviors() {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    'delete' => ['POST'],
                ],
            ],
            'access' => [
                'class' => AccessControl::className(),
                'ruleConfig' => [
                    'class' => AccessRule::className(),
                ],
                'only' => ['index', 'view', 'create', 'update', 'delete', 'activate','import-json-ttc'],
                'rules' => [
                    [
                        'actions' => ['index', 'view', 'create', 'update', 'delete', 'activate', 'import-json-ttc'],
                        'allow' => true,
                        'roles' => [
                            UserIdentity::ROLE_ADMIN
                        ]
                    ],
                ],
            ],
        ];
    }

    /**
     * Lists all Products models.
     * @return mixed
     */
    public function actionIndex() {
        $searchModel = new ProductSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
                    'searchModel' => $searchModel,
                    'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Products model.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionView($id) {
        return $this->render('view', [
                    'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Products model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate() {
        $model = new Products();
        if ($model->load(Yii::$app->request->post())) {
            $request = Yii::$app->request->bodyParams;
            //debugPrint($request);exit;
            if ($model->save()) {
                if (!empty($model->categories_id)) {
                    foreach ($model->categories_id as $cid) {
                        $pCategory = new \app\models\ProductCategories();
                        $pCategory->category_id = $cid;
                        $pCategory->product_id = $model->product_id;
                        $pCategory->save();
                    }
                }
                $images = explode('~~', $model->image_url);
                if (!empty($images)) {
                    foreach ($images as $img) {
                        $pCategory = new \app\models\ProductImages();
                        $pCategory->product_id = $model->product_id;
                        $pCategory->image_url = $img;
                        $pCategory->save();
                    }
                }
                return $this->redirect(['view', 'id' => $model->product_id]);
            } else {
                return $this->render('create', [
                            'model' => $model,
                ]);
            }
        }
        return $this->render('create', [
                    'model' => $model,
        ]);
    }

    /**
     * Updates an existing Products model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionUpdate($id) {
        $model = $this->findModel($id);
        if ($model->load(Yii::$app->request->post())) {
            $request = Yii::$app->request->bodyParams;
            if ($model->save()) {
                \app\models\ProductCategories::deleteAll('product_id = '.$model->product_id);
                if (!empty($model->categories_id)) {
                    foreach ($model->categories_id as $cid) {
                        $pCategory = new \app\models\ProductCategories();
                        $pCategory->category_id = $cid;
                        $pCategory->product_id = $model->product_id;
                        $pCategory->save();
                    }
                }
                \app\models\ProductImages::deleteAll('product_id = '.$model->product_id);
                $images = explode('~~', $model->image_url);
                if (!empty($images)) {
                    foreach ($images as $img) {
                        $pCategory = new \app\models\ProductImages();
                        $pCategory->product_id = $model->product_id;
                        $pCategory->image_url = $img;
                        $pCategory->save();
                    }
                }
                return $this->redirect(['view', 'id' => $model->product_id]);
            } else {
                return $this->render('update', [
                            'model' => $model,
                ]);
            }
        }
        return $this->render('update', [
                    'model' => $model,
        ]);
    }

    /**
     * Deletes an existing Products model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws NotFoundHttpException if the model cannot be found
     */
    public function actionDelete($id) {
        $model = $this->findModel($id);
        $model->is_deleted = 1;
        $model->save(false);

        return $this->redirect(['index']);
    }
    
    public function actionActivate($id) {
        $model = $this->findModel($id);

        if ($model->is_active == 0)
            $model->is_active = 1;
        else
            $model->is_active = 0;

        if ($model->save(false)) {
            return '1';
        } else {

            return json_encode($model->errors);
        }
    }
    
    public function actionFeatured($id) {
        $model = $this->findModel($id);

        if ($model->is_featured == 0)
            $model->is_featured = 1;
        else
            $model->is_featured = 0;

        if ($model->save(false)) {
            return '1';
        } else {

            return json_encode($model->errors);
        }
    }

    public function actionImportJsonTtc($store="")
    {
        $feed  = file_get_contents("productfeed.json");
        $json = json_decode($feed,true);
        if(!empty($json['products'])){
            foreach ($json['products'] as $products)
            {
                //debugPrint($products);
                $product = new Products();
                $product->network_id = 3;
                $product->feed_id = $products['ID'];
                $product->name = $products['name'];
                $product->price = $products['price']['amount'];
                $product->retail_price = $products['price']['amount'];
                $product->sale_price = $products['price']['amount'];
                $product->currency = $products['price']['currency'];
                $product->buy_url = $products['URL'];
                $product->description = $products['description'];
                $product->advertiser_name = $store;
                $addtionalInfo = '';
                $addtionalInfo.= !empty($products['properties']['categoryPath'][0])?'Category: '.$products['properties']['categoryPath'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['condition'][0])?'Condition: '.$products['properties']['condition'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['color'][0])?'Color: '.$products['properties']['color'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['gender'][0])?'Gender: '.$products['properties']['gender'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['availability'][0])?'Availability: '.$products['properties']['availability'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['discount'][0])?'Discount: '.$products['properties']['discount'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['fromPrice'][0])?'Actual Price: '.number_format($products['properties']['fromPrice'][0],2).' '.$products['price']['currency'].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['rating'][0])?'Rating: '.$products['properties']['rating'][0].'<br/>':"";
                $addtionalInfo.= !empty($products['properties']['validTo'][0])?'Valid To: '.$products['properties']['validTo'][0].'<br/>':"";
                $product->additional_info = $addtionalInfo;
                $product->is_stock = 1;
                $product->is_active = 1;
                $product->save(false);
                //
                if (!empty($products['images'])) {
                    foreach ($products['images'] as $img) {
                        $pCategory = new \app\models\ProductImages();
                        $pCategory->product_id = $product->product_id;
                        $pCategory->image_url = $img;
                        $pCategory->save();
                    }
                }
            }
        }
        return $this->redirect(['index']);
    }
    /**
     * Finds the Products model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Products the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id) {
        if (($model = Products::findOne($id)) !== null) {
            return $model;
        }

        throw new NotFoundHttpException('The requested page does not exist.');
    }

}