Return-Path: <SRS0=FDtJ=RR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517DEC43381
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:51:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0FADA21019
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 14 Mar 2019 08:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="EDhwDREd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfCNIvP (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 14 Mar 2019 04:51:15 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:32947 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbfCNIvP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Mar 2019 04:51:15 -0400
Received: by mail-io1-f68.google.com with SMTP id b6so4480172iog.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Mar 2019 01:51:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EmKmR/Znqy8sFh7Ya7Ep6uGQyb4ndrvy3hC7pPWTkXU=;
        b=EDhwDREdNm+A9TmxzPNBQeVVM8IiXeaDVTIJQvogM3HJGvTS0UUSe3YgN/kveBdSyK
         U7ouLiE4pK8OR1xoA2gBg1yIDJSBCqO4vM5fhltHhdJEGMvzJLz+1vEgMRhco3jNVgZX
         ivwbYf5+EtF5FUESR6658XDIAvvBscG1q87FlcYDZ7aljKrfHjGrLcsf48ejia3oxIwP
         tdCVfwHVcQ275ypDpUGQ90mf/WrY36Lp2qS4GEMWbWfSW2vGotc5RUKCNF5qMjux84l7
         2ckje7E2cH9BVUWZuq4D4skEnlAwdfEgjkAAma3MVGQbAY+pyDkfRYQCv4rs1ALPhddT
         kX4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EmKmR/Znqy8sFh7Ya7Ep6uGQyb4ndrvy3hC7pPWTkXU=;
        b=qC1QWI5T3ePqQXDtrszAuFuql5+1KJK6fgTHrEoZwBIjr3H6ZgWCpIVsToEgC0txgK
         CckJmd7fQZal6n2a70uU3EMxXMvOaARyqhuUMyaxEXoilxsdjUgRbAhxO1y3PYQVcCTJ
         OSfrFbRX3WyDfQnRAQzjmrDW4x7yC37BAWZuJi6YT+vRr481Lr6CXsaeLIMWrtnFUY81
         T2MKc+rYIMH20T4ZpuabkndRvbIVcpRBU/fW3hbcKswHJIvZXZ4lTkteOkvr3k2EgubF
         oKeY/mM51ID/7TLej/JYzfyS4i9TSKmOai0wAtUDUfpt6M5xFIqXx8yXAYrQ988tZ0P+
         gvFg==
X-Gm-Message-State: APjAAAW12t9w2bJROzKRrpV7O11nqOBxUW7Dm5lF/Syv3sPCqOCNP4ic
        MSg8a80eMU8FXYPBUg7oJ5vbALvVqRWatwHX2qcW+P22
X-Google-Smtp-Source: APXvYqydmcxUff90wHurLayTU61cS+yNt9SJ0TA8mZJopCv4qJYqVWcdDU0Bz9gEmCcCGT4vZH1wp8+z8q1bVcYtQ8I=
X-Received: by 2002:a6b:6e0f:: with SMTP id d15mr19084341ioh.111.1552553474776;
 Thu, 14 Mar 2019 01:51:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com>
 <20190313210924.GB3480@kunai> <CAMRc=McLcqooWZY0j+SZ0cPGb-U+-nApOnjK6ADCuRCEpBJ8_w@mail.gmail.com>
 <20190313211938.GC3480@kunai>
In-Reply-To: <20190313211938.GC3480@kunai>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 14 Mar 2019 09:51:03 +0100
Message-ID: <CAMRc=MeejmWOF5iFdiOiwysoOVGwxGYM6bOTmjd-2-VgcDfbig@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] i2c: improve i2c_new_{device|dummy}
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

=C5=9Br., 13 mar 2019 o 22:19 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82=
(a):
>
>
> > No problem. Once you'll have these in your tree, could you provide me
> > with an immutable branch and I'll try to dig it out for at24 for v5.2?
>
> Quoting my cover letter ;)
>
> =3D=3D=3D
>
> If the feedback is positive, then I plan to create an immutable branch fo=
r the
> at24- and MFD-trees after next rc1, so stuff can be based on top of it.
>

Point taken. Thanks!

Bart

> -----BEGIN PGP SIGNATURE-----
>
> iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyJc+oACgkQFA3kzBSg
> KbaZNw//QKa58jcJaRbJYvmnw3QOtzrIrRK4TI9l6dVM6nb9gtcDtS1oJM6qvE9s
> PthN6nNOBj9+TOepD34gTgnfal+QhafC23SjziETrfAE/N57seKttJZW+P2JOKhW
> LLIkYIU8tmC68PLOxNTLbk8yG63n8z2527ICzF1Jp06v4RDP2FMntMRvaD5d5M48
> mJMrNCR9nzX52bk5lXu1zw4Tdh4vj3IwRFa2uUUA+dS7EYt82cRT6pq8BiGk/Svg
> NaySKqXjiNDHG8EQLUuQF7e30LWo+D+JCqxG0E+ir1rINlw9dJkzQSA49UmMbwn0
> jwwCFoM15ugVDAohdI64Pj5FiNGMl5zt2Fw3Ude0G+n5SN1BKRG2v947OvCJtYra
> Yd3PBT7CfubqfZHK4cF9SqGTsavHBYACIzOCjHCAnZDsrNEANCFuDcFUla94WQsa
> USMBw/BnEI6rpPlCgUA5n0NrcGResj3g9GJXxD7x0JKSjKyBXBeApZUx4tEWa2m8
> tc+JAHJ136BFDI7zaRgi2LDqFBvYwZpvJt0ttc9uA1B3u3UecG2QHBjp6XdTc7qM
> aDhXSYTxBXP6fJeFI3cf4aIwN9HqsWNwJDnG3I+/9ODiwvtG7IQFjxXJ+dSGSrlw
> 0sAWsPg3mavtEVjSYBLuUDZAchHGTULpjf/38iTx2D6BmmtX3S4=3D
> =3DRd2y
> -----END PGP SIGNATURE-----
