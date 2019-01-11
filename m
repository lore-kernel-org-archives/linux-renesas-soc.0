Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC52C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:52:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2CD572063F
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 14:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547218333;
	bh=HajEArRFRmoz5JK2HV3VnqK7jOQYdXBNMTAdy3Vhk98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=baeYlu6+5+0RVyrwvHMMWI4xuBZX7LeWu8cxlDdzJO79/f9UhRqPYNJXo1oaDbbIv
	 tpwwFgd+BZ/RI9nLlh2ykAMAUsy/nRJ16Cu7NBnzjsVFYHlmDpCDLS5pbAeShGJZot
	 q/iwmNkLfuGIFYCjW6XjEKyZOw1mrAjR8k2gAhsY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390617AbfAKOwM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 09:52:12 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:37695 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403767AbfAKOjD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 09:39:03 -0500
Received: by mail-ot1-f66.google.com with SMTP id s13so4772821otq.4;
        Fri, 11 Jan 2019 06:39:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Mi96pIAEmH8vmWsGXtxKK0yfd+JyovF6E+68ygoVB0A=;
        b=p0pqORNasqwrdfj988aWY4ZwvZxKYWZe0mxKPmDKMOD/BF4vZzUit9zjthx5q5hGwK
         WpxOBcLHYfq3XjD2kJJ4KKSf3Ar2Fr27SlvuApHBMVy+LFQrP84Eps53OOFK04jvtrAi
         DTKGxz6Z9Wygp++YorctYyiP5U/y9nATZuad5ggR87Jpm5NGMovCwVM9fjqRuZtF1Y3u
         MMXC4nkCqX93qvqJJ7AfMqeW3XFwZtiyAgamal8+G1SH1ssa/rdsn4KBujSumVOfCDbv
         aT2pC1ZfUmHyjN1QtKZCb9lurYIVA6DOmibakai8m4C+PVGR+NDgKCvRm6f17hMGeOSu
         IFfA==
X-Gm-Message-State: AJcUukcroqCCu4Q4CrcenrKiJ/XCGFMnpBUuoejD5EdNdMLX634Edu4W
        AvqCm1plMsWZUypxELMXPQ==
X-Google-Smtp-Source: ALg8bN4TY+2guKsr5gCmb9c00ItTlfZbtITS191TbWZfrWfj8RC0vDbXPZsVKu2tk4mxqZzyFIwueg==
X-Received: by 2002:a9d:2661:: with SMTP id a88mr10056863otb.91.1547217542845;
        Fri, 11 Jan 2019 06:39:02 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u19sm37795939oia.31.2019.01.11.06.39.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 06:39:02 -0800 (PST)
Date:   Fri, 11 Jan 2019 08:39:01 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
        Mason Yang <masonccyang@mxic.com.tw>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        linux-renesas-soc@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 1/2] dt-bindings: spi: renesas-rpc: document R8A77980
 bindings
Message-ID: <20190111143901.GA28026@bogus>
References: <72626acd-9d5f-14a1-6464-5fdeba17fece@cogentembedded.com>
 <08a3ff4d-3ee3-91dd-c048-55a09b6dfc63@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <08a3ff4d-3ee3-91dd-c048-55a09b6dfc63@cogentembedded.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, 28 Dec 2018 13:47:09 +0300, Sergei Shtylyov wrote:
> Document the R-Car V3H (R8A77980) SoC in the Renesas RPC-IF bindings.
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
>  Documentation/devicetree/bindings/spi/spi-renesas-rpc.txt |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
