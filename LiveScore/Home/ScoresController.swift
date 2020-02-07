import UIKit


class ScoresController: BaseViewController, ScoresView {
    
    @IBOutlet weak var imgArrow: UIImageView!
    @IBOutlet weak var lbTwoDayAgo: UILabel!
    @IBOutlet weak var lbDateTwoDayAgo: UILabel!
    @IBOutlet weak var lbOneDayAgo: UILabel!
    @IBOutlet weak var lbDateOneDayAgo: UILabel!
    @IBOutlet weak var lbToday: UILabel!
    @IBOutlet weak var lbDateToday: UILabel!
    @IBOutlet weak var lbNextDay: UILabel!
    @IBOutlet weak var lbDateNextDay: UILabel!
    @IBOutlet weak var lbTwoNextDay: UILabel!
    @IBOutlet weak var lbDateTwoNextDay: UILabel!
    @IBOutlet weak var tbMatch: UITableView!
    @IBOutlet weak var viewDataEmpty: UIView!
    
    var presenter:ScoresPresenter!
    var config: ScoresConfiguration = ScoresConfigurationImplementation()
    override func viewDidLoad() {
        super.viewDidLoad()
        config.configure(scoresControler: self)
        presenter.viewDidLoad()
        setupTime()
        setTodayActive(index:5)
        setupTableView()
    }
    override func viewWillAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.tbMatch.reloadData()
            
        }
    }
    func setupTableView(){
        tbMatch.register(UINib(nibName: "SectionScoresTableViewCell", bundle: nil), forCellReuseIdentifier: "sectionScoresTableViewCell")
        tbMatch.delegate = self
        tbMatch.dataSource = self
        tbMatch.beginUpdates()
        tbMatch.reloadData()
        tbMatch.endUpdates()
    }
    func reloadTableView() {
        tbMatch.reloadData()
        
        if presenter.numberOfList == 0 {
            viewDataEmpty.isHidden = false
        }else {
            viewDataEmpty.isHidden = true
        }
        
    }
    
    func moveTop(){
        let indexPath = IndexPath(row: 0, section: 0)
        self.tbMatch.moveRow(at: indexPath, to: indexPath)
    }
    
    func setupTime(){
        lbDateToday.text = getDate(date: Date.today)
        
        lbTwoDayAgo.text = getNameOfDate(date: Date.twoDayAgo)
        lbDateTwoDayAgo.text = getDate(date: Date.twoDayAgo)
        
        lbOneDayAgo.text = getNameOfDate(date: Date.yesterday)
        lbDateOneDayAgo.text = getDate(date: Date.yesterday)
        
        lbNextDay.text = getNameOfDate(date: Date.tomorrow)
        lbDateNextDay.text = getDate(date: Date.tomorrow)
        
        lbTwoNextDay.text = getNameOfDate(date: Date.twoNextDay)
        lbDateTwoNextDay.text = getDate(date: Date.twoNextDay)
        
        
    }
    func getDate(date:Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
    func getNameOfDate(date:Date) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEE"
        return dateFormatter.string(from: date)
    }
    
    func setTodayActive(index:Int){
        resetDefault()
        switch index {
        case 1:
            lbTwoDayAgo.font = .boldSystemFont(ofSize: 15)
            lbDateTwoDayAgo.font = .boldSystemFont(ofSize: 15)
            lbTwoDayAgo.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateTwoDayAgo.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 3:
            lbOneDayAgo.font = .boldSystemFont(ofSize: 15)
            lbDateOneDayAgo.font = .boldSystemFont(ofSize: 15)
            lbOneDayAgo.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateOneDayAgo.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 5:
            lbToday.font = .boldSystemFont(ofSize: 15)
            lbDateToday.font = .boldSystemFont(ofSize: 15)
            lbToday.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateToday.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 7:
            lbNextDay.font = .boldSystemFont(ofSize: 15)
            lbDateNextDay.font = .boldSystemFont(ofSize: 15)
            lbNextDay.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateNextDay.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        case 9:
            lbTwoNextDay.font = .boldSystemFont(ofSize: 15)
            lbDateTwoNextDay.font = .boldSystemFont(ofSize: 15)
            lbTwoNextDay.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateTwoNextDay.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            break
        default:
            lbToday.font = .boldSystemFont(ofSize: 15)
            lbDateToday.font = .boldSystemFont(ofSize: 15)
            lbToday.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
            lbDateToday.textColor = #colorLiteral(red: 1, green: 0.3855193555, blue: 0, alpha: 1)
        }
    }
    func resetDefault(){
        lbTwoDayAgo.setLabelDefault()
        lbDateTwoDayAgo.setLabelDefault()
        lbOneDayAgo.setLabelDefault()
        lbDateOneDayAgo.setLabelDefault()
        lbToday.setLabelDefault()
        lbDateToday.setLabelDefault()
        lbNextDay.setLabelDefault()
        lbDateNextDay.setLabelDefault()
        lbTwoNextDay.setLabelDefault()
        lbDateTwoNextDay.setLabelDefault()
    }
    
    @IBAction func moveTwoDayAgo(_ sender: Any) {
        SocketIOManager.getInstance().closeConnection()
        presenter.getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd",date: Date.twoDayAgo), endDate: covertDateToString(type: "yyyy-MM-dd",date: Date.twoDayAgo), team_id: 0, leagues_id: 0, season_id: 0, include: "")
        moveArrow(index: 1)
    }
    @IBAction func moveOneDayAgo(_ sender: Any) {
        SocketIOManager.getInstance().closeConnection()
        presenter.getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd",date: Date.yesterday), endDate: covertDateToString(type: "yyyy-MM-dd",date: Date.yesterday), team_id: 0, leagues_id: 0, season_id: 0, include: "")
        moveArrow(index: 3)
    }
    @IBAction func moveToday(_ sender: Any) {
        SocketIOManager.getInstance().establishConnection()
        presenter.getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd",date: Date.today), endDate: covertDateToString(type: "yyyy-MM-dd",date: Date.today), team_id: 0, leagues_id: 0, season_id: 0, include: "")
        moveArrow(index: 5)
    }
    @IBAction func moveTomorrow(_ sender: Any) {
        SocketIOManager.getInstance().closeConnection()
        presenter.getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd",date: Date.tomorrow), endDate: covertDateToString(type: "yyyy-MM-dd",date: Date.tomorrow), team_id: 0, leagues_id: 0, season_id: 0, include: "")
        moveArrow(index: 7)
        
    }
    @IBAction func moveTwoNextDay(_ sender: Any) {
        SocketIOManager.getInstance().closeConnection()
        presenter.getListMatches(startDate: covertDateToString(type: "yyyy-MM-dd",date: Date.twoNextDay), endDate: covertDateToString(type: "yyyy-MM-dd",date: Date.twoNextDay), team_id: 0, leagues_id: 0, season_id: 0, include: "")
        moveArrow(index: 9)
    }
    
    func moveArrow(index:Int){
        setTodayActive(index: index)
        let x = self.view.bounds.size.width
        let y = self.view.frame.origin.y + 1
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       options: [.curveEaseInOut , .allowUserInteraction],
                       animations: {
                        self.imgArrow.center = CGPoint(x: (x / 10) * CGFloat(index), y: y)
        })
    }
    
    func handleError(title: String, content: String) {
        self.showAlertWithOnlyCancelAction(title: title, message: content, alertType: .alert, cancelTitle: "Ok", cancelActionHandler: nil)
    }
}
extension ScoresController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionScoresTableViewCell") as! SectionScoresTableViewCell
        cell.dataLeagues = presenter.getItemOfList(index: indexPath.row)
        cell.clickDetail = {(matchesId) in
            self.presenter.presentMatchDetail(matchesId:matchesId)
        }
        cell.clickLeagues = {
            self.presenter.presentLeaguesDetail(leaguesId: self.presenter.getItemOfList(index: indexPath.row).league_id ?? 0)
        }
        cell.handlerFavorites = {(matchesId) in
            self.presenter.handlerFavorites(matchesId: matchesId)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
