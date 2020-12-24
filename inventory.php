<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Аптека</title>
    <link rel="stylesheet" href="./css/style.css">
    <script src="./js/back.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script src="https://use.fontawesome.com/8889c0a3c3.js"></script>
</head>
<body>

<div style="padding-bottom: 500px;" class="container-fluid sec2">
   
   

      <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #0a23355e;">
        <a class="navbar-brand" href="#">Аптека</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
          <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.html">Главная<span class="sr-only">(current)</span></a>
              </li>
            <li class="nav-item">
              <a class="nav-link" href="zakazi.php">Заказы</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="inventory.php">Медикаменты</a>
            </li>
          </ul>
  
        </div>
      </nav>


        <h1 style="margin-top: 100px;color:beige" class="text-center">Доступные медикаменты</h1>
         <table style="margin-top: 100px; " class="table table-dark">
            <thead>
              <tr>
                <th scope="col">ID</th>
                <th scope="col">Наименование</th>
              </tr>
            </thead>
            <tbody>
            <?php
include('./php/includes/db.php');

$result=mysqli_query($connection,"SELECT * FROM `medicaments`");

while(($cat=mysqli_fetch_assoc($result)))
{
  
  echo '<tr>';
  echo '<th scope="row">'. $cat['ID'].'</th>';
  echo '<td>'. $cat['Name']. '</td>';
  echo '</tr>';
  
}
mysqli_close($connection);
?>




            </tbody>
          </table> 
          <br>

    </div>


</body>
</html>
