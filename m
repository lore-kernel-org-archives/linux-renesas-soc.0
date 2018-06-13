Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:44235 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934619AbeFMQoG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Jun 2018 12:44:06 -0400
Received: by mail-lf0-f66.google.com with SMTP id 36-v6so4943817lfr.11
        for <linux-renesas-soc@vger.kernel.org>; Wed, 13 Jun 2018 09:44:05 -0700 (PDT)
Subject: Re: [PATCH v2] arm64: dts: renesas: condor/v3hsk: specify Ethernet
 PHY IRQs
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Simon Horman <horms@verge.net.au>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-kernel@lists.infradead.org
References: <4acc208e-c593-1e8a-00ca-fc9a5574074e@cogentembedded.com>
 <42861d8f-3570-03b9-987c-bb15fa92a9c7@cogentembedded.com>
Message-ID: <9d6f18ad-47d1-eb81-1a86-d124ca03e1c9@cogentembedded.com>
Date: Wed, 13 Jun 2018 19:44:02 +0300
MIME-Version: 1.0
In-Reply-To: <42861d8f-3570-03b9-987c-bb15fa92a9c7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/13/2018 07:42 PM, Sergei Shtylyov wrote:

> Specify Ethernet PHY IRQs in the Condor/V3HSK board device trees, now that
> we have the GPIO support (previously phylib had  to resort to polling).
> 
> Based on the original (and large) patch by Vladimir Barinov.
> 
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

   Forgot to add the the patch is against the 'renesas-devel-20180613-v4.17' tag.

[...]

MBR, Sergei
