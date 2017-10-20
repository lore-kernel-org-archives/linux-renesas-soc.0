Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:53492 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752793AbdJTKDR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Oct 2017 06:03:17 -0400
Received: by mail-io0-f193.google.com with SMTP id 189so12687971iow.10
        for <linux-renesas-soc@vger.kernel.org>; Fri, 20 Oct 2017 03:03:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171016074601.jrcvxxm6minuq7u3@verge.net.au>
References: <20171015124615.31391-1-wsa+renesas@sang-engineering.com>
 <20171015124615.31391-4-wsa+renesas@sang-engineering.com> <20171016074601.jrcvxxm6minuq7u3@verge.net.au>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 20 Oct 2017 12:03:16 +0200
Message-ID: <CAPDyKFozG2m1HN5wn6hbnrxZO2jTXS12Z0V7+A_TTZGDLy2gPQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: renesas: salvator: set driver type for eMMC
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 16 October 2017 at 09:46, Simon Horman <horms@verge.net.au> wrote:
> On Sun, Oct 15, 2017 at 02:46:15PM +0200, Wolfram Sang wrote:
>> These boards are known to have eMMC issues with the default driver type.
>> Specify a working one.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>
> Hi,
>
> I have marked this as deferred pending acceptance of the bindings.
> Please repost or otherwise ping me once that dependency has been accepted.

Simon, I have picked up the bindings, so you may now pick up $subject patch.

Kind regards
Uffe
