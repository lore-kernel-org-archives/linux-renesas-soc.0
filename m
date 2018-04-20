Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:33228 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753708AbeDTHIs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 03:08:48 -0400
Received: by mail-io0-f180.google.com with SMTP id s25-v6so3476059ioa.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Apr 2018 00:08:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180419200907.udbe3v744a4tvu6c@ninjato>
References: <66c0b103-ed6e-36e0-74a6-9809ba55939c@cogentembedded.com> <20180419200907.udbe3v744a4tvu6c@ninjato>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Apr 2018 09:08:46 +0200
Message-ID: <CAPDyKFqM5+oWNoPU1Htj1WVwd798LqCN-3p__3-4ygf_Lhknew@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi_internal_dmac: add R8A77980 to whitelist
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19 April 2018 at 22:09, Wolfram Sang <wsa@the-dreams.de> wrote:
> On Thu, Apr 19, 2018 at 11:07:44PM +0300, Sergei Shtylyov wrote:
>> I've successfully tested eMMC on R8A77980/Condor. R8A77980 has a single
>> SDHI core anyway, so can't be a subject of the known RX DMA errata...
>
> Lucky you ;)
>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>

Seems like this one also should go for fixes/stable then?

Kind regards
Uffe
