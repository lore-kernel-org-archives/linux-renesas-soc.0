Return-Path: <SRS0=s8sg=SO=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DBE7C10F0E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:12:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4CBF32082E
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 12 Apr 2019 10:12:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="b3LdXfbP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726727AbfDLKMO (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 12 Apr 2019 06:12:14 -0400
Received: from mail-eopbgr1410127.outbound.protection.outlook.com ([40.107.141.127]:63866
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726713AbfDLKMO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 12 Apr 2019 06:12:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-bp-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmqtqFBooT/R4AMExI1gEW6EG+p9S1+9sG4vXQIYC4A=;
 b=b3LdXfbPkpqPzNXS3657UfkCDkhojen3PB52P4KJyKS511BjqLbSxiEnSATlppkaO5nI4v600QA/8uXmk1UC14VST2ucSt9lCU/HpV7ieldYX+uv1fazZ8yelUIrUokbuv00v6KDm/3qS2VIdFKEROTQDW5SC/clpLo2Q54A76I=
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com (52.133.163.147) by
 TY1PR01MB1466.jpnprd01.prod.outlook.com (52.133.163.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1771.16; Fri, 12 Apr 2019 10:12:09 +0000
Received: from TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9b4:609a:1271:478f]) by TY1PR01MB1770.jpnprd01.prod.outlook.com
 ([fe80::9b4:609a:1271:478f%3]) with mapi id 15.20.1792.009; Fri, 12 Apr 2019
 10:12:09 +0000
From:   Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To:     Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Subject: Color Keying
Thread-Topic: Color Keying
Thread-Index: AdTxFsn9K2T76xs8STW7FzhVEIAvkQ==
Date:   Fri, 12 Apr 2019 10:12:09 +0000
Message-ID: <TY1PR01MB1770CA2D8AFEEAAF55045AD0C0280@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=fabrizio.castro@bp.renesas.com; 
x-originating-ip: [193.141.220.21]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f08133df-60a1-4e2a-86ad-08d6bf2f532f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(5600139)(711020)(4605104)(4618075)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);SRVR:TY1PR01MB1466;
x-ms-traffictypediagnostic: TY1PR01MB1466:
x-microsoft-antispam-prvs: <TY1PR01MB14663730CC4BB9AD6CFDA068C0280@TY1PR01MB1466.jpnprd01.prod.outlook.com>
x-forefront-prvs: 0005B05917
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(376002)(396003)(39860400002)(136003)(346002)(366004)(199004)(189003)(68736007)(71200400001)(99286004)(2906002)(7696005)(3480700005)(4744005)(52536014)(4326008)(5660300002)(6436002)(478600001)(316002)(66066001)(71190400001)(3846002)(86362001)(74316002)(305945005)(8936002)(7736002)(486006)(54906003)(186003)(6116002)(44832011)(33656002)(97736004)(14454004)(256004)(53936002)(106356001)(102836004)(105586002)(9686003)(7116003)(8676002)(81166006)(26005)(55016002)(25786009)(6506007)(81156014)(107886003)(476003)(221733001);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB1466;H:TY1PR01MB1770.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:0;MX:1;
received-spf: None (protection.outlook.com: bp.renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SKN7T3ey2zT8WkRVr8ZWjg7OkuqGvfhiQ0zWBaUI5xtKpwphcEusr2S/L/o1It+R8Lm7jVQFtCmig7qQpTfbgWstSUH/DM8VviB5oY3XE+xT4MdPHBFXqyhTHJsxMDd0SHjR/K+OHzprX57jP5QBTpK+sPZiUHpQVsjSFJP6W2krkxyO96y0oY/bDI/jKuN2X6Y13BHVzk80w6GkCBifXeZAGeSkqrLzCYzaL/O1oY8qqcWFFZwm8o+ygD3BuSrGshbYgAzq5aee/DfH/mZoIHkQYxPGHrb7TwUp+1/zDdt5BkcK0rtvFdgvIC1l3yEX1K/ds0yNA3DjEmVlYerSf1c/458WdfMMNcob3u3w0yxqHvhnBMUF3PRNXJL7mZKfOKxf3eacv8g+Iqc00iiCrIWHeNexYflWwb5ylZUlQMk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f08133df-60a1-4e2a-86ad-08d6bf2f532f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2019 10:12:09.6623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB1466
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hello Laurent,

has colour keying ever been tested on R-Car Gen3?
I am working on HDMI support for the RZ/G2E, and I wanted to test "colorkey=
", but it
looks like that once you have RCAR_DU_FEATURE_VSP1_SOURCE defined within th=
e
features member of the SoC specific rcar_du_device_info struct, rcar_du_mod=
eset_init
won't call rcar_du_planes_init.

Is my understanding correct?
Is this behaviour desired?
Is there anything I can do to quickly test it on my RZ/G2E?

Thanks,
Fab




