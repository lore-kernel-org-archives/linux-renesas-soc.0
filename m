Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8EB4C282CC
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:04:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 77C9C217D6
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 15:04:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kb1hWMyG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfBEPEh (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 10:04:37 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:51775 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726742AbfBEPEg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 10:04:36 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 85D4625B7E9;
        Wed,  6 Feb 2019 02:04:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1549379074; bh=xmHuAPSknEUMYPcCFIJ6pYiIxjlAuiwpOi/UMrId+sw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kb1hWMyGoSohJ7CGXrIbpX3ywSLUZyCrcV9WArSvE+J9J7cHyjX01yLYNW6GUrA8u
         UpICfBuywEh2ZK7s0DbUNgNlO35hwCm9ydlQvSpuTKp+zJzXBFd0qWpUqJ9AAgAHfB
         pSHA/fiPZpAJs8A/6RD8ZiQIt24NUanYI6Nb1tP4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B0DF2940486; Tue,  5 Feb 2019 16:04:32 +0100 (CET)
Date:   Tue, 5 Feb 2019 16:04:32 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 4/5] dt-bindings: timer: renesas: tmu: Document
 r8a774c0 bindings
Message-ID: <20190205150432.ngl4suuhcum35hhl@verge.net.au>
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com>
 <1549272007-33471-5-git-send-email-biju.das@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1549272007-33471-5-git-send-email-biju.das@bp.renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 04, 2019 at 09:20:06AM +0000, Biju Das wrote:
> Document RZ/G2E (R8A774C0) SoC in the Renesas TMU bindings.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

