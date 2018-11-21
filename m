Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f195.google.com ([209.85.166.195]:35076 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbeKULEM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 21 Nov 2018 06:04:12 -0500
Received: by mail-it1-f195.google.com with SMTP id v11so6528632itj.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 20 Nov 2018 16:32:16 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
References: <20181120230832.1840-1-wsa+renesas@sang-engineering.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 21 Nov 2018 01:31:35 +0100
Message-ID: <CAPDyKFotAvkLzpAeDvvv0GB=_nJsJPkRbRc657=o3ftoxdXZDA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] mmc: refactor RPMB block count handling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
        Avri Altman <avri.altman@wdc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

+ Avri, Cl=C3=A9ment (due to recent related discussions)

On 21 November 2018 at 00:08, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> On Renesas R-Car SDHI hardware, we sometimes had timeouts accessing the R=
PMB.
> This is because AutoCMD23/12 features needs a properly filled sbc to work
> correctly. But RPMB sends an individual CMD23. I could have fixed the dri=
ver
> but after some research concluded that fixing the core seems the proper t=
hing
> to do. I also added some sanity checking while here. Please let me know w=
hat
> you think.
>
> Tested on a R-Car M3-N. No timeouts showed up anymore. I'll try to improv=
e the
> testing, though, to check if I can make the occasional timeouts from befo=
re
> more reproducible. And then confirm that this patchset improves the situa=
tion :)
>
> Wolfram Sang (3):
>   mmc: core: validate user input for RPMB block count
>   mmc: core: use mrq->sbc when sending CMD23 for RPMB
>   mmc: core: remove obsolete mmc_set_blockcount() function
>
>  drivers/mmc/core/block.c | 14 +++++++++-----
>  drivers/mmc/core/core.c  | 14 --------------
>  drivers/mmc/core/core.h  |  2 --
>  3 files changed, 9 insertions(+), 21 deletions(-)
>
> --
> 2.11.0
>

These changes makes perfect sense to me! I give it a day or two to
allow people to comment/test, then I will queue them up.

Perhaps we should add a suggested by tag from Cl=C3=A9ment for patch2, as
he kind of suggested this change already [1].

Kind regards
Uffe

[1]
https://patchwork.kernel.org/patch/10645847/
