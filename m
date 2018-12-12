Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BC7CC65BAE
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 03:14:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 088BF20839
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 03:13:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="JF0r8qEK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 088BF20839
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726372AbeLLDN7 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 22:13:59 -0500
Received: from mail-eopbgr1400109.outbound.protection.outlook.com ([40.107.140.109]:28352
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726220AbeLLDN7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 22:13:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FZt1FMKt7ms3ZiMPXacjOtHDskuiVfG8Ve0Oc5/okfM=;
 b=JF0r8qEKcvgfZLNLJIHMxtVL+h5tU0PZ7fCg0m3K4/ZxuW0fUTBP2b3tly1N+WHFEX3SKLPaCihn2I4KdiCDGx7IP/uJUEz0/nyOzX7N4DJaiYLEf+/1xr1hg0QIobruVlq7B6JntV9LjCmJVjq3OT6s1XttdUGwzgmLHfBp7Qw=
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com (52.134.243.14) by
 OSBPR01MB2149.jpnprd01.prod.outlook.com (52.134.241.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1425.19; Wed, 12 Dec 2018 03:13:54 +0000
Received: from OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5]) by OSBPR01MB2293.jpnprd01.prod.outlook.com
 ([fe80::c070:7362:375f:74c5%6]) with mapi id 15.20.1404.026; Wed, 12 Dec 2018
 03:13:54 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>
Subject: RE: pwm: rcar: improve calculation of divider
Thread-Topic: pwm: rcar: improve calculation of divider
Thread-Index: AQHUjna/G/BVsIdLvUaL7PU+E+TEPaV25fgAgACHXuCAADOcgIAC0yXQ
Date:   Wed, 12 Dec 2018 03:13:54 +0000
Message-ID: <OSBPR01MB2293D189DCEA1EFB89A1AC34D8A70@OSBPR01MB2293.jpnprd01.prod.outlook.com>
References: <1544171373-29618-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20181207214932.xckuuarcka733v7y@pengutronix.de> <1828832.OCLkmioh6N@avalon>
 <OSBPR01MB2293ED3087627127A1A884A4D8A50@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20181210080413.6367nhxhoj6ecqhl@pengutronix.de>
In-Reply-To: <20181210080413.6367nhxhoj6ecqhl@pengutronix.de>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.140]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;OSBPR01MB2149;20:AyucrJvvRlrcWKlK9rJ6SE/+9+FhwpuD3typV6AhzSLqOxxAo9kNMTupANEKP9PCuxGJ7w9aVtglmRB9n/d9+UmckMvSjpsfQ1RrJZBDDT4Ng8bGA2sivmKywUnf21oOjT6MRdzJcyMzFafaUkjgORUsiY+cjaI5huxVUQ8ykjU=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 5b0905f4-a693-4b9b-ced2-08d65fdfd912
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390098)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:OSBPR01MB2149;
x-ms-traffictypediagnostic: OSBPR01MB2149:
x-microsoft-antispam-prvs: <OSBPR01MB2149C4CC821A5E6451DB4DF4D8A70@OSBPR01MB2149.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(3230017)(999002)(6040522)(2401047)(5005006)(8121501046)(93006095)(93001095)(3231472)(944501520)(4982022)(52105112)(10201501046)(3002001)(6055026)(148016)(149066)(150057)(6041310)(20161123564045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(20161123562045)(20161123560045)(201708071742011)(7699051)(76991095);SRVR:OSBPR01MB2149;BCL:0;PCL:0;RULEID:;SRVR:OSBPR01MB2149;
x-forefront-prvs: 0884AAA693
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(136003)(396003)(39860400002)(366004)(346002)(376002)(189003)(199004)(446003)(25786009)(106356001)(11346002)(476003)(478600001)(66066001)(105586002)(3846002)(6116002)(99286004)(966005)(33656002)(93886005)(316002)(54906003)(2906002)(71200400001)(71190400001)(97736004)(561924002)(6916009)(6436002)(7736002)(74316002)(486006)(256004)(5660300001)(305945005)(229853002)(7696005)(26005)(345774005)(4326008)(6246003)(6506007)(102836004)(8936002)(81156014)(39060400002)(81166006)(8676002)(9686003)(68736007)(86362001)(76176011)(53936002)(186003)(6306002)(14454004)(55016002);DIR:OUT;SFP:1102;SCL:1;SRVR:OSBPR01MB2149;H:OSBPR01MB2293.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: bA+woNFU6AwWHEpWahrssAMv4TXs7XFNN1U64g/zgjz7Spq36oYCnOIotFxVzKLBO+Wyj+LjDS2rKpnUucJGg/1IU77Ab7hYy/0A1N5tu7X38mYgn9WlABqpveRI6mEK+ayWVodCnearJ9Db1X13cJ9TayXthbysZTZFF1mak8CGm0bZwiZU8YeDWSFUZoEbM7d7YOiX+bhb9eEDk+1DgUcgQ+o+wy49x/eqitR8wTssHBrkSSqCLR70REjKi0NiOjZv0Ggxhwy2k9i5speiDaiE8PXfVkrc4a+yRredEnqe/fH82Xc9Tm/ljXEQDRsx
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b0905f4-a693-4b9b-ced2-08d65fdfd912
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Dec 2018 03:13:54.1706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB2149
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Uwe,

> From: Uwe Kleine-K=F6nig, Sent: Monday, December 10, 2018 5:04 PM
>=20
> Hello,
>=20
> On Mon, Dec 10, 2018 at 05:09:31AM +0000, Yoshihiro Shimoda wrote:
> > Thank you very much for your patches!
> > I tested patches and both codes work correctly.
>=20
> \o/, that's actually better than I expected :-)
>=20
> > > > The value of div should be calculatable without a loop. Something l=
ike:
> > > >
> > > >    divider =3D NSEC_PER_SEC * RCAR_PWM_MAX_CYCLE;
> > > >    tmp =3D (unsigned long long)period_ns * clk_rate + (divider - 1)=
;
> > > >    do_div(tmp, divider);
> >
> > This should be do_div64_u64() because the divider is 1,023,000,000,000 =
(over 32-bits).
>=20
> Yes, I think Laurent did this part right.
>=20
> > > >    div =3D ilog2(tmp - 1) + 1;
> > > >
> > > > You might want to check if my maths are right, I didn't test.
> > >
> > > I've noticed the same, and wrote the following patch last week, also =
untested.
> > > I was planning to give it a try before sending it out, but as you've =
noticed
> > > the same issue, here's the code if anyone wants to give it a try befo=
re I can.
> > > Our calculations are similar, the main difference is the last line, a=
nd I
> > > think yours read better.
> >
> > So, I'd like to apply Uwe's code to mainline. Uwe, may I send such a pa=
tch
> > with your author and Singed-off-by?
>=20
> Please no, I cannot sing good enough for this :-)
>=20
> Honestly: If you take the authorship and write something like "Algorithm
> suggested by Uwe Kleine-K=F6nig and Laurent Pinchart" that's IMHO fine.

Thank you for your reply. I got it. I'll make a patch with such comment :)

Best regards,
Yoshihiro Shimoda

> Best regards
> Uwe
>=20
> --
> Pengutronix e.K.                           | Uwe Kleine-K=F6nig          =
  |
> Industrial Linux Solutions                 | http://www.pengutronix.de/  =
|
