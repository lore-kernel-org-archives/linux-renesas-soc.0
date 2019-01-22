Return-Path: <SRS0=QNR1=P6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47A26C282C3
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:22:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 06EAD21019
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 22 Jan 2019 10:22:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="M/WTXUNp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbfAVKWZ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 22 Jan 2019 05:22:25 -0500
Received: from mail-eopbgr1310130.outbound.protection.outlook.com ([40.107.131.130]:36712
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726857AbfAVKWZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Jan 2019 05:22:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WhGA+Z4K5Mp9yahvi0PAqptbCTmeJ5lEFz34nvSKIBQ=;
 b=M/WTXUNpubyT4OxceUtBIJSBoIOQ+dFBkfs885bT6TFX+RTHMtDVq9Ytiowu/nYqUMVmNZ1KZPPTzyxWS8tsaQRCjPYM3zIoOQdZ1eNoEQvzD/1KM4qtWgJr/Jv5XarWLlDtItdeDtlTAwwtT/SMeQkf3rFecXJA/gWAEZGLcEA=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB4700.jpnprd01.prod.outlook.com (20.179.170.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1537.26; Tue, 22 Jan 2019 10:22:20 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::147c:3145:e9bf:f22e%3]) with mapi id 15.20.1537.031; Tue, 22 Jan 2019
 10:22:20 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: BUG report on next-20190122: could not probe the ravb driver
Thread-Topic: BUG report on next-20190122: could not probe the ravb driver
Thread-Index: AdSyPCR41ZhYSHzPTU6yOzTiVkr33w==
Date:   Tue, 22 Jan 2019 10:22:20 +0000
Message-ID: <TY2PR01MB4812D22909738F4D981B359ED8980@TY2PR01MB4812.jpnprd01.prod.outlook.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [118.238.235.108]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY2PR01MB4700;20:/s6ADBTAZiLpWhcmhcCCsHqEPSlTdfvam+eBo0nS+bQwTqoHd9M95S9lEWkiNwgpjlpK8qvgHicy+Fmz4hyz6NPozLYFqW3YatD6KoChfv1XxVzPpfwaYiveSB4rnSJQLOTSsAbJW2a5zkCNdFqB2NGaBBvpLqH1+wYshoTaQ2k=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 2cbb4510-1ac1-494d-22d7-08d680537dd8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600109)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB4700;
x-ms-traffictypediagnostic: TY2PR01MB4700:
x-microsoft-antispam-prvs: <TY2PR01MB47003A5E12EFF218DFBBB213D8980@TY2PR01MB4700.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0925081676
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(366004)(376002)(136003)(39860400002)(396003)(199004)(189003)(8936002)(106356001)(6436002)(3846002)(6116002)(25786009)(14454004)(8676002)(6506007)(102836004)(81166006)(81156014)(2906002)(33656002)(26005)(105586002)(476003)(6916009)(316002)(186003)(2351001)(99286004)(97736004)(7696005)(68736007)(86362001)(74316002)(55016002)(53936002)(305945005)(478600001)(2501003)(5640700003)(9686003)(486006)(71190400001)(71200400001)(66066001)(256004)(7736002);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB4700;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: xf8GOiniTQd4HC9hb0ttl6fdDDh//P+96cBHzvErnXGHHTCVJhvvPI7ihMOxKO3A4RC+0PQ+WYFsRXHqnVrEnZx5S0tPnNSf+i7l6OvxdzGOjxuaCtlWad+2sRnartZ2xeaVQTO3T9+s3H0PoAIhWGVnM7GxsKelHIpP+B7kqf83x9mV27dCej+LSZX68PPnb1yVWCEEU4Gc86ugt4l8vqCteOOdkI/NgJ+PqlddkcXvIzakFxcJWQpU6Vnr2xSPk06xANY5O5mtViqDIw0VIWT+GlG6jc8G3t1Ldf+MaA8qlks9ZaaWqsap1/x8F34lb7EbfxMfduiijLgqkF9Mq8kNssgLPO5jUQ2GPJzHTd0NRWWjT5THvcb9A2HwffuzlftUyzARo7NycQH3toPwrAwOaVaUhs6EkgErcHEwMwY=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cbb4510-1ac1-494d-22d7-08d680537dd8
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2019 10:22:20.0400
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB4700
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

I got a report from test team that next-20190122 could not probe the ravb d=
river as the following.
The test team is using H3 ES3.0 Salvator-XS and I could also reproduce this=
 issue on M3-N Salvator-XS.

[ 3.005557] ravb e6800000.ethernet: ignoring dependency for device, assumin=
g no driver=20
[ 3.013863] libphy: ravb_mii: probed=20
[ 3.017743] mdio_bus e6800000.ethernet-ffffffff:00: error -2 loading PHY dr=
iver module for ID 0x00221622=20
[ 3.027283] ravb e6800000.ethernet: failed to initialize MDIO=20
[ 3.033157] ravb: probe of e6800000.ethernet failed with error -2

# I didn't investigate this issue yet though...

Best regards,
Yoshihiro Shimoda

