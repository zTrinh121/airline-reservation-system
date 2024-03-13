

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>FLIGHT</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="decorate/flight.css"/>

    <body  style=" background-image: linear-gradient(rgba(49, 18, 75, 0.5), rgba(49, 18, 75, 0.5)), url(images/home_slider.jpg);">
        <div class="container">
            <h1 class="text-center"style="color: #fff;font-size: 48px;font-weight: 800" ><b>FLIGHT LIST</b></h1> 
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2 style="color: #ffffff;">Flight Information</h2> <!-- Điều chỉnh màu sắc cho tiêu đề -->
                        </div>
                        <div class="col-sm-6">
                          
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>
                                FlightId
                            </th>
                            <th>From city</th>
                            <th>To city</th>
                            <th>Address</th>
                            <th>Departure day</th>
                            <th>Arrival day</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                1
                            </td>
                            <td>Thomas Hardy</td>
                            <td>thomashardy@mail.com</td>
                            <td>89 Chiaroscuro Rd, Portland, USA</td>
                            <td>(171) 555-2222</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               2
                            </td>
                            <td>Dominique Perrier</td>
                            <td>dominiqueperrier@mail.com</td>
                            <td>Obere Str. 57, Berlin, Germany</td>
                            <td>(313) 555-5735</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                3
                            </td>
                            <td>Maria Anders</td>
                            <td>mariaanders@mail.com</td>
                            <td>25, rue Lauriston, Paris, France</td>
                            <td>(503) 555-9931</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                               4
                            </td>
                            <td>Fran Wilson</td>
                            <td>franwilson@mail.com</td>
                            <td>C/ Araquil, 67, Madrid, Spain</td>
                            <td>(204) 619-5731</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr>					
                        <tr>
                            <td>
                               5
                            </td>
                            <td>Martin Blank</td>
                            <td>martinblank@mail.com</td>
                            <td>Via Monte Bianco 34, Turin, Italy</td>
                            <td>(480) 631-2097</td>
                            <td>
                                <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a>
                                <a href="#deleteEmployeeModal" class="delete" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Delete">&#xE872;</i></a>
                            </td>
                        </tr> 
                    </tbody>
                </table>
               
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="addEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Add new Flight</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Flight ID</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>From city</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>To city</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Departure Date</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Arrival Date</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Departure Time</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Arrival Time</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Seat Economy</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Seat Business</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price Economy</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price Business</label>
                                <input type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-success" value="Add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Edit Modal HTML -->
        <div id="editEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Edit Flight</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <label>Flight ID</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>From City</label>
                                <input type="email" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>To city</label>
                                <textarea class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Departure Date</label>
                                <input type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Arrival Date</label>
                                <input type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>departure Time</label>
                                <input type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Arrival Time</label>
                                <input type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Seat Economy</label>
                                <input type="text" class="form-control" required>
                            </div>
                             <div class="form-group">
                                <label>Seat Business</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price Economy</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price Business</label>
                                <input type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Jet ID</label>
                                <input type="text" class="form-control" required>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel" >
                            <input type="submit" class="btn btn-info" value="Save" style="background-color: #52452b">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Delete Modal HTML -->
        <div id="deleteEmployeeModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form>
                        <div class="modal-header">						
                            <h4 class="modal-title">Delete Employee</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <p>Are you sure you want to delete these Records?</p>
                            <p class="text-warning"><small>This action cannot be undone.</small></p>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="submit" class="btn btn-danger" value="Delete">
                        </div>
                    </form>
                </div>
            </div>
        </div>
          <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal" style="background-color: #7e57c2;"><i class="material-icons">&#xE147;</i> <span>Add New Flight</span></a> <!-- Điều chỉnh màu sắc cho nút -->
    </body>
</html> 
