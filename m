Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:42166 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726811AbeJCWhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Oct 2018 18:37:48 -0400
Received: by mail-lj1-f194.google.com with SMTP id y71-v6so5577086lje.9
        for <linux-renesas-soc@vger.kernel.org>; Wed, 03 Oct 2018 08:48:51 -0700 (PDT)
Subject: Re: [PATCH] mmc: renesas_sdhi: rename DTRAN_MODE_BUS_WID_TH to
 DTRAN_MODE_BUS_WIDTH
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1538566780-30794-1-git-send-email-yamada.masahiro@socionext.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c45bd9f9-23da-4802-8918-fec5efebc6d6@cogentembedded.com>
Date: Wed, 3 Oct 2018 18:48:48 +0300
MIME-Version: 1.0
In-Reply-To: <1538566780-30794-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/03/2018 02:39 PM, Masahiro Yamada wrote:

> Socionext UniPhier SoCs use the almost the same internal DMAC.
> My datasheet says 'BUS_WIDTH' instead of 'BUS_WID_TH'.  I suspect
> this is a typo.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

   Already fixed, see:

https://git.kernel.org/pub/scm/linux/kernel/git/ulfh/mmc.git/commit/?h=devel&id=652c517c6828a830b71db4b1439a0229c98d9b9e

MBR, Sergei
