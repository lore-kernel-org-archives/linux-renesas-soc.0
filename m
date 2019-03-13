Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B052FC43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 20:55:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A1A32077B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 20:55:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="TXR94QO/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727058AbfCMUzo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 16:55:44 -0400
Received: from mail-it1-f195.google.com ([209.85.166.195]:37903 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726582AbfCMUzn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 16:55:43 -0400
Received: by mail-it1-f195.google.com with SMTP id k193so1116266ita.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 13:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7cJ5llZ/ZxQTG2j/waKtscSFfR05d74LG7ggmAGx9XI=;
        b=TXR94QO/fOLYS3PdfkJ3K29qiVkvi9aMwECkH/8j+hJ+4tpIqn5Q+HSCqPJUKwCYZb
         wPpPUtsLOkCMQRVNUQe36K7glQLpCt6aIVqmF7aZU6VpWMhHJubo2pQAFJKPZa9OP8Om
         xAi6a0h9d/BBr/8NFNXscPz7h9aCtihncmPgJWOdbtI98v52FVKodb2KMGpBFgparlk1
         mjO5uvKp2rGcdZjkcNVsET2wwbVfvlBK3YwK+57GvgG8jZ25WCbbhRcB7ocM8B2ZNU6w
         YaDjBdLZL4xo9DpyZskGT7nwQNEEPzZlOvaeumiW2f0bPVPYx9i5gkaC/ggup78BtbnT
         OWdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7cJ5llZ/ZxQTG2j/waKtscSFfR05d74LG7ggmAGx9XI=;
        b=VRt8bLIY3B7p7thPyTu3u3kwlq4/qpiGU6+X4ezL7dTgwhfRZVE3ZIoTP6GwO0ToCx
         Mjlgll+5jmzCoskGy+vs8JBrmbyQsEyruaFngC231jpiq08M2/idiM0jIJStG+5pfhYM
         4C/OqHUCjusn74w8BNhsPjZmCGk/SbZ5T7sLFlKv53XxwgzQmBO3IDOZeagmfbPSYELM
         G6l9n+ZiETNcyC+GnucfeYoAzQs8slJxYb6ZF1wHvYwV1C+iGERfRBGzTOLxXv/uV3I7
         VMAkRgAvmnd4QY7512mdwW+iS4DdxIwdiXXY5f/6FQZ9f7f8kTVyBAJjc6pp+CkRTz0N
         IdfA==
X-Gm-Message-State: APjAAAUEaSO1z5VJP7f7WaB1koGOSeXug3C76Fi3y6qW78gWdIWUT8sK
        c1tqIyg/9mBvxy3uLFOs4SM74OcXZbl+tLsQygRVQR6v
X-Google-Smtp-Source: APXvYqyYi6jPalsXaz7NPUR0CIaSnh1N0IRyNzQI9RWFNjWMM6Wddwv/nEZlGPfkG6QnCIdk9M+tYctx2dKaiNVODLA=
X-Received: by 2002:a24:418c:: with SMTP id b12mr104336itd.74.1552510542546;
 Wed, 13 Mar 2019 13:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Mar 2019 21:55:31 +0100
Message-ID: <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] i2c: improve i2c_new_{device|dummy}
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc:     linux-i2c <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Kieran Bingham <kieran@ksquared.org.uk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

=C5=9Br., 13 mar 2019 o 17:56 Wolfram Sang
<wsa+renesas@sang-engineering.com> napisa=C5=82(a):
>
> I recently remembered this old series because I needed to add a dummy to =
the
> DA9063 driver, so I had a look at it. I am somewhat sorry for the long de=
lay,
> yet the overload of patches is something I am not really responsible for =
:/
>
> However, the series v6 from December 2017 was mostly OK. I decided to fix=
 the
> things I noticed right away, only minor stuff:
>
> * instead of '__' prefix for the new functions, I added an 'errptr' suffi=
x.
>   '__' indicates internal use, mostly unlocked flavors. However, these fu=
nctions
>   could be exported somewhen and then it makes sense to have a more descr=
iptive
>   name. This also removes the inconsistency that the devm_* variant retur=
ned an
>   errptr while the non-devm variant returned NULL. Now, the name makes it=
 clear.
>
> * some minor issues/typos in the kernel doc sections
>
> This series does not include converting 'i2c_new_secondary_device' which =
I plan
> to convert (including all users) to use errptr only. And maybe the same f=
or
> 'i2c_new_probed_device', I am not sure about it yet.
>
> I added a new user of this series, since at24 has changed a bit since bac=
k then.
> Patch 3 is only for testing. First, this series needs to be applied.
>
> Tested on a Renesas Lager board (R-Car Gen2).
>
> If the feedback is positive, then I plan to create an immutable branch fo=
r the
> at24- and MFD-trees after next rc1, so stuff can be based on top of it.
>
> Looking forward to comments,
>
>    Wolfram
>
>
> Heiner Kallweit (2):
>   i2c: core: improve return value handling of i2c_new_device and
>     i2c_new_dummy
>   i2c: core: add device-managed version of i2c_new_dummy
>
> Wolfram Sang (1):
>   mfd: da9063: occupy second I2C address, too
>
>  Documentation/driver-model/devres.txt |   3 +
>  drivers/i2c/i2c-core-base.c           | 114 ++++++++++++++++++++++++++++=
++----
>  drivers/mfd/da9063-i2c.c              |   2 +
>  include/linux/i2c.h                   |   3 +
>  4 files changed, 109 insertions(+), 13 deletions(-)
>
> --
> 2.11.0
>

Wasn't there a patch using this new managed variant in at24 as well?

Bart
