Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:54809 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728694AbeHVNM5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Aug 2018 09:12:57 -0400
Received: by mail-it0-f67.google.com with SMTP id s7-v6so2101660itb.4
        for <linux-renesas-soc@vger.kernel.org>; Wed, 22 Aug 2018 02:48:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
References: <0f984d54-77bc-44b2-4c4a-79a158bbc7e2@cogentembedded.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Aug 2018 11:48:47 +0200
Message-ID: <CAPDyKFp=JYAE6f2yo6hWnHbgMvXLAbuSi_A04z7Z062AO8EWtg@mail.gmail.com>
Subject: Re: [PATCH 0/2] Fix some typos in Renesas R-Car gen3 SDHI driver
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 17 August 2018 at 22:16, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Hello!
>
> Here's a set of 2 patches against the 'next' branch of Ulf Hannsson's 'mmc.git' repo.
> They fix some typos I noticed...
>
> [1/2] mmc: renesas_sdhi_internal_dmac: fix typo in DM_CM_DTRAN_MODE.BUS_WIDTH field name
> [2/2] mmc: renesas_sdhi_internal_dmac: fix comment typo
>
> MBR. Sergei

Thanks, squashed and queued for v4.20!

Kind regards
Uffe
