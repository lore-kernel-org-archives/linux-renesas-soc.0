Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEB9C282D0
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 15:02:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6C1EB2175B
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 15:02:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="pf9wJbbx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728710AbfA2PCV (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 10:02:21 -0500
Received: from mail-eopbgr1400135.outbound.protection.outlook.com ([40.107.140.135]:28956
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728550AbfA2PCU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 10:02:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mchFLxdD1hxSV3yJXlAPtO17mD3AS6fazg/lOoSs72s=;
 b=pf9wJbbxkduj5/1PND2apF/u6p1+hbMqQwawcmIRaSDGRkQwEHd7ooQvDyjI5laZn8blp04iMK1+Uhgds1I/XwfWqGLoLRH8Q/RMiAmTn+UAnCDuNkWgAgngBKmsX/XQrRoui7IJXJ8+plTmnX5uiluRYOCHqoqRtIg1023vhp8=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB1625.jpnprd01.prod.outlook.com (52.133.162.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1580.16; Tue, 29 Jan 2019 15:02:15 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::74fc:a361:eeec:1678%5]) with mapi id 15.20.1558.025; Tue, 29 Jan 2019
 15:02:15 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Simon Horman <horms@verge.net.au>
CC:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>
Subject: RE: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
Thread-Topic: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
Thread-Index: AQHUtmclqIklh3XXpkyvAVv/Nu3mUqXEmwSAgAAyYICAARcWAIAALAYAgABJDSA=
Date:   Tue, 29 Jan 2019 15:02:15 +0000
Message-ID: <TY1PR01MB15628BF7F66DCCE3CD1827D58A970@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
 <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
 <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
 <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
In-Reply-To: <e5b05616-d9b3-3c0a-189b-4fc02190c8a5@cogentembedded.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [75.60.247.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB1625;20:ORzNWl5w7/CyZ+Gipz6StaGRqkD4o7FOmpfi3B90hHT2O22GiCbtUgWhEXCuPgN2il1QiCyCpJej/bPPzTb7iboe1oj2rOTOT09t9L4U46sBZX9FyWRSE0OeB2sqpzVyejZph3yDhiyl7kzNVuHaUj6000WCTGqDg0Tq40zzZY8=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: b7f6e3ac-1101-4310-e8ee-08d685fac1b7
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600110)(711020)(4605077)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB1625;
x-ms-traffictypediagnostic: TY1PR01MB1625:
x-microsoft-antispam-prvs: <TY1PR01MB1625AC84FC3321046033AFE18A970@TY1PR01MB1625.jpnprd01.prod.outlook.com>
x-forefront-prvs: 093290AD39
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(396003)(376002)(346002)(39850400004)(136003)(366004)(189003)(199004)(2906002)(9686003)(486006)(66066001)(55016002)(229853002)(72206003)(53936002)(6246003)(26005)(6436002)(256004)(186003)(8936002)(102836004)(81166006)(53546011)(6506007)(33656002)(8676002)(81156014)(476003)(11346002)(93886005)(446003)(4744005)(76176011)(25786009)(7696005)(4326008)(99286004)(54906003)(110136005)(86362001)(14454004)(68736007)(71190400001)(71200400001)(3846002)(478600001)(6116002)(106356001)(7736002)(97736004)(305945005)(316002)(74316002)(105586002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1625;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: nvfdv06tR/E9SX5ZBfOJTRzGb9mF6oXEmkUknIil76sTScdo7meVH683DUqhSZT85ISC+UNrTQrZOxVqEnMfgHWq3N2Wgn/Hc1MF9uXbrRKHG1qJKeNPNpMT3SWdCJXGCYJWPdsRL/qvvrq6D6FczCAoigfRP4Z6F9uGaqYez+u1LRB4rcYfbeWrW0RhEhxoDVr+Md1W3PijjazRiXTSuiRJkPgyrV9MRhkDXJ5TX8LoPYgHGwqe7fguhKMgXHbzTnGtzokgRdnyYyaeiRLTlvgApMDoFlGQM6X6ZMKzMbDKazKGTkFmKw63AWVfcTvR+NZyyq+BHyhDGw1R6V6UdV0qC0vYB7YNzL92CTT63yr/evrakO1rIcYgY+Hv5nb65Sm9HGb1op6MUprkt9+X0XhTxDo25f88DNBlc2d7NcM=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b7f6e3ac-1101-4310-e8ee-08d685fac1b7
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2019 15:02:15.5835
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1625
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

T24gVHVlc2RheSwgSmFudWFyeSAyOSwgMjAxOSwgU2VyZ2VpIFNodHlseW92IHdyb3RlOg0KPiBP
biAwMS8yOS8yMDE5IDExOjAwIEFNLCBTaW1vbiBIb3JtYW4gd3JvdGU6DQo+ID4gQXMgeW91IG1h
eSBoYXZlIGd1ZXNzZWQgdGhlIGltcGxpY2F0aW9uIG9mIG15IHF1ZXN0aW9uIGlzIHRoYXQNCj4g
PiBJTUhPIGl0IHdvdWxkIGJlIGJlc3Qgb25seSB0byBhZGQgdGhpcyBmZWF0dXJlIHRvIFNvQ3Mg
d2hlcmUNCj4gPiBpdCBoYXMgYmVlbiB0ZXN0ZWQuDQo+IA0KPiAgICBZb3UgZG9uJ3QgdHJ1c3Qg
dGhlIG1hbnVhbHM/IDotKQ0KPiANCj4gTUJSLCBTZXJnZWkNCg0KSG93IHdlcmUgeW91IHRlc3Rp
bmcgdGhpcyBmZWF0dXJlIHdpdGggdGhlIFI4QTc3OTgwPw0KDQpDaHJpcw0KDQo=
