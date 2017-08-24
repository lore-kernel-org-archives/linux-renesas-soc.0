Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:33023 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753142AbdHXUB7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 24 Aug 2017 16:01:59 -0400
Received: by mail-lf0-f48.google.com with SMTP id y15so2173422lfd.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 24 Aug 2017 13:01:58 -0700 (PDT)
Subject: Re: [PATCH] dmaengine: rcar-dmac: document R8A7797 bindings
To: Vinod Koul <vinod.koul@intel.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <20170824195616.327888699@cogentembedded.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <629467f1-abb8-46b5-786c-9c8eeafa7383@cogentembedded.com>
Date: Thu, 24 Aug 2017 23:01:54 +0300
MIME-Version: 1.0
In-Reply-To: <20170824195616.327888699@cogentembedded.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/24/2017 10:56 PM, Sergei Shtylyov wrote:

> Renesas  R-Car V3M (R8A7797) SoC also has the R-Car gen2/3 compatible DMA
          ^^
    Oops, didn't notice the double space. Could be fixed while applying, I 
guess (I know Rob will be upset about double spaces)?

> controllers, so document the SoC specific binding.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
