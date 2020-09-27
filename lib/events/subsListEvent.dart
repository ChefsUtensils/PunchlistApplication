

import 'package:punchlist/SubcontractorPage/contractors.dart';

enum EventType { add, delete }

class SubsListEvent {
  Contractors contractor;
  int contractorIndex;
  EventType eventType;

  SubsListEvent.add(Contractors contractor){
    this.eventType = EventType.add;
    this.contractor = contractor;
  }

  SubsListEvent.delete(int index){
    this.eventType = EventType.delete;
    this.contractorIndex = index;
  }
}


