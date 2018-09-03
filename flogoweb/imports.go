package main

import (
	// Flogo action
	_ "github.com/TIBCOSoftware/flogo-contrib/action/flow"

	// Activities from https://github.com/TIBCOSoftware/flogo-contrib
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/actreply"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/actreturn"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/aggregate"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/app"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/awsiot"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/awssns"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/channel"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/coap"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/couchbase"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/counter"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/error"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/filter"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/gpio"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/kafkapub"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/lambda"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/log"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/mapper"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/mongodb"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/rest"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/subflow"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/twilio"
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/wsmessage"

	// Triggers from https://github.com/TIBCOSoftware/flogo-contrib
	_ "github.com/TIBCOSoftware/flogo-contrib/activity/channel"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/cli"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/coap"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/kafkasub"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/lambda"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/mqtt"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/rest"
	_ "github.com/TIBCOSoftware/flogo-contrib/trigger/timer"

	// Activities from https://github.com/retgits/flogo-components
	_ "github.com/retgits/flogo-components/activity/addtodate"
	_ "github.com/retgits/flogo-components/activity/amazons3"
	_ "github.com/retgits/flogo-components/activity/amazonsqssend"
	_ "github.com/retgits/flogo-components/activity/awsssm"
	_ "github.com/retgits/flogo-components/activity/commandparser"
	_ "github.com/retgits/flogo-components/activity/downloadfile"
	_ "github.com/retgits/flogo-components/activity/dynamodbinsert"
	_ "github.com/retgits/flogo-components/activity/dynamodbquery"
	_ "github.com/retgits/flogo-components/activity/envkey"
	_ "github.com/retgits/flogo-components/activity/githubissues"
	_ "github.com/retgits/flogo-components/activity/gzip"
	_ "github.com/retgits/flogo-components/activity/iftttwebhook"
	_ "github.com/retgits/flogo-components/activity/mashtoken"
	_ "github.com/retgits/flogo-components/activity/null"
	_ "github.com/retgits/flogo-components/activity/pubnubpublisher"
	_ "github.com/retgits/flogo-components/activity/queryparser"
	_ "github.com/retgits/flogo-components/activity/randomnumber"
	_ "github.com/retgits/flogo-components/activity/randomstring"
	_ "github.com/retgits/flogo-components/activity/readfile"
	_ "github.com/retgits/flogo-components/activity/tomlreader"
	_ "github.com/retgits/flogo-components/activity/trellocard"
	_ "github.com/retgits/flogo-components/activity/writetofile"

	// Triggers from https://github.com/retgits/flogo-components
	_ "github.com/retgits/flogo-components/trigger/pubnubsubscriber"
	_ "github.com/retgits/flogo-components/trigger/grpctrigger"
)
