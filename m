Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F93EC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 07:01:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBF2B2171F
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 07:01:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="lKQdJ4F4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbfCMHBw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 03:01:52 -0400
Received: from mail-eopbgr1310113.outbound.protection.outlook.com ([40.107.131.113]:51554
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725821AbfCMHBw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 03:01:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKKadEjdpB30kMAjvaERyBg6IxAL5ckfbYBxzrU8eLU=;
 b=lKQdJ4F4xoGqmo29zKtydowBIkl72WciDQ9uJPyhwG2WC5h26HGPAXwltd+1PjopF/mCISzzsZNPZX6xd+FWSERDJ83qpOLWQfGNIb26Zz0IaTTacJMubsk6oPOh5XD7mF48A1yOluysctqEh5jRO/L42bFFIU+AUkAhsi2U6Jo=
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com (20.179.170.147) by
 TY2PR01MB1932.jpnprd01.prod.outlook.com (52.133.181.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1686.20; Wed, 13 Mar 2019 07:01:46 +0000
Received: from TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d]) by TY2PR01MB4812.jpnprd01.prod.outlook.com
 ([fe80::f423:2ed8:938:c28d%5]) with mapi id 15.20.1709.011; Wed, 13 Mar 2019
 07:01:46 +0000
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     "linux-pwm@vger.kernel.org" <linux-pwm@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Phong Hoang <phong.hoang.wz@renesas.com>
Subject: RE: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Thread-Topic: [PATCH] pwm: Avoid deadlock warning when removing PWM device
Thread-Index: AQHU2IH/+1LD433Vm0S5q4/R44BYkqYH8fEAgAExJkA=
Date:   Wed, 13 Mar 2019 07:01:46 +0000
Message-ID: <TY2PR01MB4812E6489E20BCE94AC29E38D84A0@TY2PR01MB4812.jpnprd01.prod.outlook.com>
References: <1552360594-21547-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <20190312124532.GO31026@ulmo>
In-Reply-To: <20190312124532.GO31026@ulmo>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=yoshihiro.shimoda.uh@renesas.com; 
x-originating-ip: [211.11.155.151]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80e3b888-839f-4819-a0bb-08d6a781c1d8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY2PR01MB1932;
x-ms-traffictypediagnostic: TY2PR01MB1932:
x-microsoft-exchange-diagnostics: 1;TY2PR01MB1932;20:mLfmPAMwVvQCdwM/7/6A5/1d9FFr5wFIDGqYA/r26VfAFq8HAooME7zh3AR5Sqdjae5k8tNltkd8frTHdUh77AGImrojy2GGsxz3d6Bkwzp4cMQfk9XS4VvyWtMLjxf1ksMw2opgcXHNVrLzIq2SaxJ0/R2CqN24dyinVex/sJE=
x-microsoft-antispam-prvs: <TY2PR01MB1932487C5E63F31CD0F484F4D84A0@TY2PR01MB1932.jpnprd01.prod.outlook.com>
x-forefront-prvs: 09752BC779
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(346002)(136003)(396003)(376002)(39860400002)(366004)(199004)(189003)(229853002)(476003)(11346002)(305945005)(74316002)(71200400001)(71190400001)(446003)(8936002)(486006)(6436002)(33656002)(478600001)(4326008)(81166006)(68736007)(106356001)(81156014)(316002)(105586002)(7736002)(25786009)(256004)(14444005)(6246003)(53936002)(6916009)(54906003)(102836004)(55016002)(2906002)(3846002)(14454004)(6116002)(9686003)(5660300002)(52536013)(66066001)(107886003)(6506007)(76176011)(99286004)(8676002)(7696005)(86362001)(97736004)(186003)(26005);DIR:OUT;SFP:1102;SCL:1;SRVR:TY2PR01MB1932;H:TY2PR01MB4812.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: tFDlUORrVBkpq2yaTahqq+FhriP3mBk53XQ1gbaMjU84Fcj1S7wSiSuMs7MYA/6ivy6vltVDTqy8P4/wj94IsECe0yH0XVXQuSnp/HqGXUdHZf0ovqaAklKilgY4iM3q5JL8Pd28aJINdL5NTjhPm1dJmgxGhFGJCNktbNQX1e9oihCITLDhI+p4a3gW5xgEzOxzDOhq5z9t+YcdQ1nhl6PK72w3IaBl59es1jhLVQHZ4uNZrAl2HkUoKLNtns8fn8Jglv6lc2j70NF4q+iDb+MMeAc2+4KwO+GJgmGtKi7ZgJfQNlb+lpNi9H0zfJGGMzL4lK/ax87SjaI9WBkiQJZTv0MhChoBJtRENCOGM0NAZntoGUavzzT4POBhIRZLh4bqpcx1bWj3JTa9gQ8BJUfEoOVj7UgOcICREKZ4KcI=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80e3b888-839f-4819-a0bb-08d6a781c1d8
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2019 07:01:46.2882
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR01MB1932
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Thierry,

> From: Thierry Reding, Sent: Tuesday, March 12, 2019 9:46 PM
> On Tue, Mar 12, 2019 at 12:16:34PM +0900, Yoshihiro Shimoda wrote:
<snip>
> > @@ -368,10 +370,12 @@ int pwmchip_remove(struct pwm_chip *chip)
> >
> >  	free_pwms(chip);
> >
> > -	pwmchip_sysfs_unexport(chip);
> > -
> >  out:
> >  	mutex_unlock(&pwm_lock);
> > +
> > +	if (!ret)
> > +		pwmchip_sysfs_unexport(chip);
> > +
>=20
> I don't exactly remember why he sysfs unexport happens this late. It's
> completely asymmetric to what we do in pwmchip_add_with_polarity() and
> commit 0733424c9ba9 ("pwm: Unexport children before chip removal") is
> a strong indication that this was wrong to begin with. Maybe we should
> just move pwmchip_sysfs_unexport() where it belongs, which is right
> after pwmchip_sysfs_unexport_children(). In that case, we probably do
> not need separate functions anymore either.

I think so. So, I'll merge them on v2 patch.

> We also really want to remove sysfs irrespective of whether or not the
> chip will be removed as a result of pwmchip_remove(). We can only assume
> that the driver will be gone after that, so we shouldn't leave any
> dangling sysfs files around.

I think so.

> Yoshihiro, does it work if you move pwmchip_sysfs_unexport() to the top
> of pwmchip_remove(), right below pwmchip_sysfs_unexport_children(),
> instead? Does that get rid of the lockdep warning as well? That way it
> is also outside of the pwm_lock section, which indeed doesn't seem to be
> needed.

It works. That gets rid of the lockdep warning as well. So, I'll submit v2
patch later.

> Moving the pwmchip_sysfs_export() call outside of that section also
> seems fine and it'd be perfectly symmetric with pwmchip_remove() again.

I think so.

Best regards,
Yoshihiro Shimoda

> Thierry
