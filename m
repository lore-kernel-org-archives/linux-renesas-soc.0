Return-Path: <SRS0=pBJi=SR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31CACC10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 18:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E7F962073F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 15 Apr 2019 18:56:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="nKT0/x8m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728061AbfDOS4Q (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 15 Apr 2019 14:56:16 -0400
Received: from mail-eopbgr1410139.outbound.protection.outlook.com ([40.107.141.139]:6076
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727845AbfDOS4Q (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Apr 2019 14:56:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0LPTX4yei+uOf9x7qmhqcoJ0V4W39k3IKSIUJwFhdIs=;
 b=nKT0/x8mw1hAJcF59IyHZshgxIGrQIIuQBLB3Ptjc6Az4yCQXB2c8rYo6V5EZAfONbiLXe4WO0nM94SbNOSbQ8EZdL2mQqrKE+/na/A8hnut4NL4gLHZgHs1++HB4JyOTBg3dwT0HlDrwaaZ5J6PCjeRYfWJ9GB+4F91QUNkpgQ=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.163.12) by
 TY1PR01MB1596.jpnprd01.prod.outlook.com (52.133.162.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1792.15; Mon, 15 Apr 2019 18:56:12 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9cf9:e85b:37c7:a1d0]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::9cf9:e85b:37c7:a1d0%4]) with mapi id 15.20.1792.020; Mon, 15 Apr 2019
 18:56:12 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>
CC:     "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] i2c: riic: Add Runtime PM support
Thread-Topic: [PATCH] i2c: riic: Add Runtime PM support
Thread-Index: AQHU3wfmPrqJaCLqskmvDOfIk8liNaY9TEYAgABuBCA=
Date:   Mon, 15 Apr 2019 18:56:12 +0000
Message-ID: <TY1PR01MB1562BF88C83DA527ED5A51458A2B0@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20190320103003.20107-1-geert+renesas@glider.be>
 <20190415121718.gdowmtgwqi2aa4zp@ninjato>
In-Reply-To: <20190415121718.gdowmtgwqi2aa4zp@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [24.206.39.126]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4b1d9c66-2bbe-454f-b55a-08d6c1d407d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600140)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1596;
x-ms-traffictypediagnostic: TY1PR01MB1596:
x-microsoft-antispam-prvs: <TY1PR01MB15966EEA58C3BAE34E01C15C8A2B0@TY1PR01MB1596.jpnprd01.prod.outlook.com>
x-forefront-prvs: 000800954F
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(376002)(396003)(366004)(39860400002)(136003)(199004)(189003)(11346002)(86362001)(7736002)(256004)(52536014)(105586002)(476003)(8936002)(71190400001)(9686003)(71200400001)(26005)(305945005)(486006)(74316002)(6506007)(446003)(102836004)(33656002)(186003)(68736007)(8676002)(81156014)(7696005)(106356001)(81166006)(99286004)(25786009)(4744005)(76176011)(5660300002)(316002)(54906003)(53936002)(6246003)(2906002)(97736004)(55016002)(478600001)(6116002)(110136005)(3846002)(6436002)(229853002)(14454004)(72206003)(66066001)(4326008);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1596;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: DakRHFL1fWtJJsKSGh/8yS5HxZE08Zk/KWVYGThnxCMu2tV+1vYCmCQ2+lZfPhoea+3qiKGinP3VPFGRoiQGmF2rb3MVWzDCs1fISQuJZO5MuS/B6rq8MEhU10YPv2qfnIPdc+swXXocGMrvSWATFsPkQPYPXOHJRi0+rcSqtWG4ZiDWTNLaG8diqjOxDXqZSrANtQH0g2quBqKv40SmR70VyIhWxaC4PAn0kWtgfZGE6ocwCA3tAEuiBS+NBT9INZE5XtciDH0cAoAHW56i+kQiMWF3HdjB3/VXXBIomagEwI4Wr8wB944/cUjECbvHM/40JMAxmsD93YHqEi9v2M4Y+3Mjid2eUG/c3AfUkeBwxiro8V7fP4OrfZy4HLVBiJzCAB8uIjFfnCGFTgJ1rFJyoGCpjmP5lf+V4Vvri1U=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1d9c66-2bbe-454f-b55a-08d6c1d407d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2019 18:56:12.7003
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1596
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 15, 2019, Wolfram Sang wrote:
> On Wed, Mar 20, 2019 at 11:30:03AM +0100, Geert Uytterhoeven wrote:
> >   - Replace explicit clock handling by Runtime PM calls,
> >   - Streamline Runtime PM handling in error paths,
> >   - Enable Runtime PM in .probe(),
> >   - Disable Runtime PM in .remove(),
> >   - Make sure the device is runtime-resumed when disabling interrupts i=
n
> >     .remove().
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > I don't think it's worth splitting off the last bug fix in a separate
> > (first) patch, using explicit clock handling, as that will be replaced
> > immediately by Runtime PM calls.
>=20
> Chris, what do you think about this patch?

Tested on RZ/A1H RSK and RZ/A2M EVB using an LCD touchscreen. No issues.

Tested-by: Chris Brandt <chris.brandt@renesas.com>


