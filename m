Return-Path: <SRS0=0QpP=RQ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11646C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:18:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D654A213A2
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 13 Mar 2019 21:18:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="A8CFHhi/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727468AbfCMVSN (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 13 Mar 2019 17:18:13 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:54112 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726994AbfCMVSN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Mar 2019 17:18:13 -0400
Received: by mail-it1-f194.google.com with SMTP id x189so1290717itd.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Mar 2019 14:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=v4mtvXO+8abWCiIATClzsOcBBMm4D2/e5QSzs/kl34I=;
        b=A8CFHhi/puDolN4+ZDjUNpQl5gxm8aPPUdp11BHsZBFoOQzy/sjfKJiawjvJGDlDAa
         B0zmh6GfpTocfFoHTjZ8oJ+0CWGc5RIVLAaBRQU73AypwkWGfCZKyZFOtOKfUKwswXxh
         ncpUgilbPwDwl5txnaAE1lJ9P5HZJvLUtZG5njZ+wJkV5LeSO2UT1y6dLwWRhkUFurY2
         7QZpcbgd/J8gxnUqanu/UjH3yMHE8EWi3VJUO0i3mLkMvZZeCIo/TCFGCR6EFhrKfTnY
         nzbYKt1g9Oe78i3Y8J4vlJp5II8uhbAw/WzO73crqlnQJHctRWKqviB1vMnAMb9Snft7
         5VBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=v4mtvXO+8abWCiIATClzsOcBBMm4D2/e5QSzs/kl34I=;
        b=mRTUlz/CTPXc6UNQYCtE043uSYEctEYOVmXZqu/4uZtvdo9lWQxFpFMh2zPJaCVM/I
         1m4aHv3uerS0qoE9RVeQwfHcRIcKbX5848EWVFV9/bMl2OI4VYgMVhwHI4JDeVht+xYB
         D7aNzbWdPf4VySMvhDa0PJn8Oenbh8IfcxLzd5i+mh1Y7C8tFxfh6yih4dq0LKZywtpP
         BNgxubpyUsC1Ie1HVj05zqZDmPOSx766jGCeiHVx9bsG+4ZX5GkhOyxaTAa92jGmBjj1
         li1CL3zVCCfFqrIyFG57eKH2txeTJrGWHsKQikI5zrlqWvbKF+TTXO0ezY7vinXp36fQ
         V3Qw==
X-Gm-Message-State: APjAAAXDBNiUyRkvvd7cLqdQC+vkTCEF0lqvnDJjbgpYRy5XqrX30xOy
        FEmJgSCts3mnmAPzAhcQC9fE1JJ/cjTy8HWMmA2f0Q==
X-Google-Smtp-Source: APXvYqzJN3OxS4yvZdl0y7SBue+IAoVdx9GUt2ixVG9fHHQNpnOUwXNiUERK4IhHSEv/apa4phEdGz8ylrwF2+yS0O4=
X-Received: by 2002:a24:4755:: with SMTP id t82mr170160itb.96.1552511892259;
 Wed, 13 Mar 2019 14:18:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190313165526.28588-1-wsa+renesas@sang-engineering.com>
 <CAMRc=Mc85U_WmY1RCNMCwMPJoO2jwYxvOaNiBNbuBaigJnoaqg@mail.gmail.com> <20190313210924.GB3480@kunai>
In-Reply-To: <20190313210924.GB3480@kunai>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 13 Mar 2019 22:18:01 +0100
Message-ID: <CAMRc=McLcqooWZY0j+SZ0cPGb-U+-nApOnjK6ADCuRCEpBJ8_w@mail.gmail.com>
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

=C5=9Br., 13 mar 2019 o 22:09 Wolfram Sang <wsa@the-dreams.de> napisa=C5=82=
(a):
>
>
> > Wasn't there a patch using this new managed variant in at24 as well?
>
> My Lager board has no EEPROM, so I skipped that. I was more interested
> in the core parts for now.
>

No problem. Once you'll have these in your tree, could you provide me
with an immutable branch and I'll try to dig it out for at24 for v5.2?

Bart

> -----BEGIN PGP SIGNATURE-----
>
> iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlyJcYAACgkQFA3kzBSg
> KbbMeRAAlwHEaXAk4DZcUCvVIUiuz0j9wcNNZXpwpZJsF0+1DAOJ6LpGYRlA4HSM
> RpHMTuuiM1rtgoYrW1cp90KalfqCUBYC0+lAT/yE8CWXRCOYMHUfyhDiArDHj0Sy
> xSsIsj2dDP6FqzyGSKf//Hqfs4HXAm8kooApELrX7cQaMmarIBqf1avbtF5egR2M
> e3jIf21KG6TUhqNw4rpUmj6NOb50XomVKBOgZzTZwPQVdI5YQMxhM0vKX7ck7GYF
> RyNXP3gAdg3GqCHFy4Ot46begqMUqLwbU7Bl/D9gmJWw1Jawl5V/GA3x7p9/81g2
> iii9XLIGzZemIRnETN/XdUwuWRZiIg1WKFZFO7xCsg9VXs1Pa3EuNWLLVU2ytrrZ
> YNKzQFazbucsqVnbmFPjsmkggDynRz7g8mvjIzgBATcthbAiyMyDu660ivzUrv/2
> LG4jl3chGqkvYww6YaA6plJCtXas1rMLLwuqV7gaBQy6ZcoZu2WuJ2tPnz2xiKBo
> m7HSJeK0KfEK7IYvnKDgpMnhsHgKw+RtkngErH4l9DXbH3jJHNFQA4UOVKAnY5fF
> v1BlYCcPMBqegwjDlVHeed7IRx2L2uFHh8QXOHxP2f1R1/BOvTA6L2vcaLTu261U
> Mcftv6MvhsDGdZ4aP4UPJDbNaIIcKzt54KCpIKV62mnxMq+B9ok=3D
> =3D2v3C
> -----END PGP SIGNATURE-----
