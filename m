Return-Path: <SRS0=FLKL=Q2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CD3C10F00
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 14:08:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B1762146E
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 19 Feb 2019 14:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=axentia.se header.i=@axentia.se header.b="XrCE7taV"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726141AbfBSOIS (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 19 Feb 2019 09:08:18 -0500
Received: from mail-eopbgr140119.outbound.protection.outlook.com ([40.107.14.119]:59622
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725803AbfBSOIS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Feb 2019 09:08:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axentia.se;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u0wAIdz0umO+zQl33dAzev35ggBANEKnogaGTC5qiMM=;
 b=XrCE7taVquh6GFANTdHHiCdf6JyBx+w+kTbOyQ0Hw/tLlQ949rIUWWN0R7PVkHrO9VEa/+JfD9oP4GR76xz0pj1dLpZUfPZ6urdCofEhl+8kPjZqNcXu4PldNYjAC+PdJHpHuI8Eakd8FuenAJeDYwfSNrwVFQ7GessH04oXQw8=
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com (20.178.12.74) by
 VI1PR02MB4383.eurprd02.prod.outlook.com (20.178.9.17) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1622.19; Tue, 19 Feb 2019 14:07:34 +0000
Received: from VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::a1f1:5dc8:99c1:c590]) by VI1PR02MB4542.eurprd02.prod.outlook.com
 ([fe80::a1f1:5dc8:99c1:c590%5]) with mapi id 15.20.1622.018; Tue, 19 Feb 2019
 14:07:34 +0000
From:   Peter Rosin <peda@axentia.se>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Thread-Topic: [PATCH 1/2] i2c: gpio: fault-injector: add 'lose_arbitration'
 injector
Thread-Index: AQHUxr4fcfLg22YnMEyOEeRi3KncSaXlR/4AgAC/IwCAAEUkAIAA0BgAgAAPCwA=
Date:   Tue, 19 Feb 2019 14:07:34 +0000
Message-ID: <31a56125-8aa3-9ed1-3a68-3ae766c41cd9@axentia.se>
References: <20190217124126.7257-1-wsa+renesas@sang-engineering.com>
 <20190217124126.7257-2-wsa+renesas@sang-engineering.com>
 <CAMuHMdVLEeJ4i0rZKv8w2bAO5Q7StxqQWEEV611PPMGeE60JHA@mail.gmail.com>
 <20190218204122.j35itmqth3avo3a6@ninjato>
 <a8b62504-49c3-33a7-e8ec-46b253af13b8@axentia.se>
 <20190219131338.buwlfcxdutckpqqc@ninjato>
In-Reply-To: <20190219131338.buwlfcxdutckpqqc@ninjato>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.1
x-originating-ip: [85.226.244.23]
x-clientproxiedby: HE1PR09CA0078.eurprd09.prod.outlook.com
 (2603:10a6:7:3d::22) To VI1PR02MB4542.eurprd02.prod.outlook.com
 (2603:10a6:803:b1::10)
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=peda@axentia.se; 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8bda7fa0-aa59-4980-3a9e-08d696739859
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600110)(711020)(4605104)(2017052603328)(7153060)(7193020);SRVR:VI1PR02MB4383;
x-ms-traffictypediagnostic: VI1PR02MB4383:
x-microsoft-antispam-prvs: <VI1PR02MB4383E65C3DB30ACD5BE9CA7BBC7C0@VI1PR02MB4383.eurprd02.prod.outlook.com>
x-forefront-prvs: 09538D3531
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(396003)(376002)(346002)(136003)(39830400003)(199004)(189003)(76176011)(6436002)(4326008)(6246003)(71200400001)(71190400001)(25786009)(8936002)(65826007)(486006)(316002)(105586002)(2616005)(11346002)(58126008)(7736002)(6512007)(6916009)(74482002)(54906003)(86362001)(31696002)(446003)(476003)(97736004)(229853002)(53546011)(36756003)(68736007)(26005)(6116002)(31686004)(14454004)(3846002)(5660300002)(508600001)(99286004)(65956001)(102836004)(66066001)(6506007)(106356001)(93886005)(81156014)(2906002)(65806001)(6486002)(305945005)(386003)(53936002)(8676002)(64126003)(81166006)(5024004)(14444005)(256004)(52116002)(186003);DIR:OUT;SFP:1102;SCL:1;SRVR:VI1PR02MB4383;H:VI1PR02MB4542.eurprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: axentia.se does not designate
 permitted sender hosts)
x-microsoft-exchange-diagnostics: =?Windows-1252?Q?1;VI1PR02MB4383;23:nYTjWETe0m+/H3x9S6mAwUryLxZL8+41fpbkz?=
 =?Windows-1252?Q?6SPnoygzzoCSFFQZYpRABGiJbaK3VLHyVgOqXOfKYvWwvwf95ytQyFT5?=
 =?Windows-1252?Q?eTCtkG9JG3zO4PR3CHiAMbXsFjmYzE08gFYTVzrj7I58w6NKVG70w5Az?=
 =?Windows-1252?Q?Ohl1gZ0qu5O0XXgJS/jdPCZIlUCLJ1q6VhwcrEDUcnzVFQQ1WtQIu3Ec?=
 =?Windows-1252?Q?Bby7ao0RZXV8rxBrFpuSbXspC5dsYUWE0k/tuFN35QTR6A/mS8DvnVWr?=
 =?Windows-1252?Q?I1NRDEutuMuRhUbfKxGawOVU3o7BagW/eCUmTWk/DYikgqARfh0cgJdG?=
 =?Windows-1252?Q?wCGttbtekmOPHDxqtIPs8QMwfLaVOUyPSeDIVW0jJts0JE1LbrLRrjkQ?=
 =?Windows-1252?Q?IjFNWFJYep0KuSj44pQMpAeuDxdg1Ry7fNHywPEijkSFaogevXP2LtUJ?=
 =?Windows-1252?Q?5PSXvrX9xeA8Dd1abFFvzXrvRSEY2k+1qQltpv5mmXCvrsOSuyryeS5h?=
 =?Windows-1252?Q?NRhPRRplidbPQhWayuZ+c7CEGtOGkhlySDLeHTUh2QBKqRNM0+F1BpGr?=
 =?Windows-1252?Q?6DgcLzVQehUokae4coZwrRvJxdD4Xe14zyl6Ok/8EB2lFMI39N7wzZYO?=
 =?Windows-1252?Q?nDXCHrOh1Ie5kUBkAeGZ5r/U8oj4VWXQmJNsGSBdA3m+7gDRjQ1aun+/?=
 =?Windows-1252?Q?BjrxycRUjCEXV4gAqjaWK+LsPqORkJJ7Rh6P3oTsjLDrZ0Jdurw+nABT?=
 =?Windows-1252?Q?3nRs6BliYM5BAdyNGucMXlxAtt8ZuL5m44Fjyu35HCXYVcDnrFC1tCMO?=
 =?Windows-1252?Q?SgE5s74WW8EwByHlom8aJj+X2FFZGYoHbb0Ps0vB1moefo4qe4EBUwKJ?=
 =?Windows-1252?Q?mPJjSlm6ctkMgusxS6VIPnwWeq0ir2dDfg66EWqncTA/BXr+NnZJhj5D?=
 =?Windows-1252?Q?oXrh0J/NxJpSkraFF+vIVzNp2lKYvZdrsfkvsD5JT96/XQGv+WSeoJrj?=
 =?Windows-1252?Q?JObl6nyqrKY5qdjUkV8hpjTT3sF6FVv19cz3ejHJa45swupDAcbYbdxZ?=
 =?Windows-1252?Q?1jOyfI2Y41o60cI2Y3Y4R1y19PVwB8jU2zHo7pt9pB4z40mjAU0qFMdx?=
 =?Windows-1252?Q?eTC0ZptZz431hx244Fk+kIZNDWAVDc5T54eVt2aR/A23heM3uOkJ40q3?=
 =?Windows-1252?Q?3C72j9eFhcz+z8S5u1rJ5pixawJSyJKuo0UUyMe1+fKEL8bhnTFv/hAj?=
 =?Windows-1252?Q?Iz9mMTp8JzI2DCPP2Wda56vyQ9DkH26ulS9H4xVspAd6ZUKbOCPkBBpW?=
 =?Windows-1252?Q?yhsTISkzACsHtaLWC3BeftTnC00LkAs7kZ5XJmvOZAnJgq935XJkixJz?=
 =?Windows-1252?Q?lqPlFxN/yKWJZMs62Bdcq6rwgTaBqJHS8gLMqtRFS+/vL/koYiYZtOZu?=
 =?Windows-1252?Q?TF51AT1Gg3tqbt2XHgX43t+dLmoMCayeVQPiMkCANWeWKUa9OE7CTJnR?=
 =?Windows-1252?Q?ZciqKqWvA7pyGrbkaMusMwR80Fq8TJfcppE684/Ht9GlJ5FmJ3DMJh2H?=
 =?Windows-1252?Q?bhO0t9pTJUHR584pjP48ks+FoOFHeJRIHh7?=
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: NI9sqaEGyRzdhYYdhib5QE4d8OPkdRfLWr0XAOfsNxs5I8yKnZBrMopIFDU0G3dlMRMgj8wtejidEAdsa2d9UkR477YO8agArZCWl6UAiwgR5d1I4Z8zJtRq5SxQ2PEpHTwJibepna++EXEN0cc30+3peN6ZzTs1EGV/I6aJ2Zv6JedwlvaPpdd4/jBfqY859yOt2swaUhBRzY16evVPJ5VD3GlGaGiauj1jwxrOE9RwARfwYZATUaQcUwpYpXGp48fPaebwPXRHkqxB3XlMEgqO1z85J/iZX4/6AN9puvlrddSG1HIr0ih6TXsI1aD3MesWhWlhrWEa6t4TNm7gilWzfejdgnTqwDDAPk3AEA4EniMpYcz+hQUNvLsRYDQ1NGqVko4PHij1tpaDi0+dq2euWhK876NGd3Wcb91eiS4=
Content-Type: text/plain; charset="Windows-1252"
Content-ID: <22E6A58F1329084891194391F72C2CCB@eurprd02.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: axentia.se
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bda7fa0-aa59-4980-3a9e-08d696739859
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Feb 2019 14:07:33.6610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-id: 4ee68585-03e1-4785-942a-df9c1871a234
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR02MB4383
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 2019-02-19 14:13, Wolfram Sang wrote:
>=20
>>>>> +       ret =3D gpiod_direction_output(priv->scl, 1);
>>>>
>>>> This may overwrite the error code returned by request_irq().
>>>
>>> Yeah. What do you think about this, is this too dense?
>>>
>>> 	ret =3D gpiod_direction_output(priv->scl, 1) ?: ret;
>>
>> That may also overwrite the error code, of course. Isn't it
>> usually best to return the first error? I have no clue if that
>> guideline does not apply here, though...
>=20
> I am neither entirely sure here. My take was that the above was the more
> severe error. Because if setting to output fails, the GPIO I2C bus will
> be broken. If the former stuff fails, well, the injection didn't work or
> was interrupted.
>=20
> However, the GPIO was set to output before the injector. So, if setting
> it back fails, then the system likely has more severe problems anyhow?

One way to end up with that is if there is an irq attached to the gpio
pin. If you disable the irq, you are (sometimes) allowed to change the
gpio to output, but not if the irq is active. So, if some other part of
the driver "steals" the gpio by activating an irq while the injector is
doing its thing, it is possible to end up with this.

But that seems like a gigantic corner case.

> I am open to any better solution. However, let's not forget, this is
> debug code aimed to be used by devs.
>=20

You are right, please ignore me.

Cheers,
Peter
