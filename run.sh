cd Mri-app/mriapp
# Run mri-server dispatch test
python MriApp.py --config mri-server-config
# Run matplotlib dispatch test
python MriApp.py --config matplotlib-config
# Run override test
python MriApp.py --solver_override "/home/vagrant/Files/001/solver.prototxt"
cd -
