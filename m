Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A93C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 68A3F206BA
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:42:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725923AbfDZJmo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:42:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:44790 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726871AbfDZJlQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:41:16 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 1278D25AED2;
        Fri, 26 Apr 2019 19:41:15 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 1092E9403ED; Fri, 26 Apr 2019 11:41:13 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:41:12 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Cao Van Dong <cv-dong@jinso.co.jp>
Cc:     linux-renesas-soc@vger.kernel.org, geert+renesas@glider.be,
        broonie@kernel.org, devicetree@vger.kernel.org,
        mark.rutland@arm.com, daniel.lezcano@linaro.org,
        tglx@linutronix.de, robh@kernel.org,
        yoshihiro.shimoda.uh@renesas.com, kuninori.morimoto.gx@renesas.com,
        h-inayoshi@jinso.co.jp, na-hoan@jinso.co.jp
Subject: Re: [PATCH v2 0/5] Add TPU support for R-Car H3/M3-W/M3-N
Message-ID: <20190426094112.r6nyvpnhcb2j4qv6@verge.net.au>
References: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1556155517-5054-1-git-send-email-cv-dong@jinso.co.jp>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi,

On Thu, Apr 25, 2019 at 10:25:12AM +0900, Cao Van Dong wrote:
> This series adds tpu support for r8a7795/r8a7796/r8a77965 SoCs.
> Based on the renesas-drivers-2019-04-02-v5.1-rc3 tag of renesas-drivers tree.
> For test, after booting, I found the device was registered in the booting log.

Could you clarify some details of this test.

Looking at the DTS patches I see 'status = "disabled";' for each
of the newly added devices. So I would not expect them to be probed
at run-time without some extra tweaking.

> 
> Cao Van Dong (5):
>   clk: renesas: r8a779{5|6|65}: Add TPU clock
>   arm64: dts: renesas: r8a7795: Add TPU support
>   arm64: dts: renesas: r8a7796: Add TPU support
>   arm64: dts: renesas: r8a77965: Add TPU support
>   dt-bindings: pwm: renesas: tpu: Document R8A779{5|6|65} bindings
> 
>  Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.txt |  3 +++
>  arch/arm64/boot/dts/renesas/r8a7795.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a7796.dtsi                  | 11 +++++++++++
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi                 | 11 +++++++++++
>  drivers/clk/renesas/r8a7795-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a7796-cpg-mssr.c                    |  1 +
>  drivers/clk/renesas/r8a77965-cpg-mssr.c                   |  1 +
>  7 files changed, 39 insertions(+)
> 
> -- 
> 2.7.4
> 
