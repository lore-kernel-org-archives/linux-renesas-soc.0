Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420D1C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 05:29:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10A312084A
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 05:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545024558;
	bh=ZoNaJtyPEsEUQ8dr2j1Tf7RvncxmAuS4c8L1eUOgqzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=0868wyI9lSPimPbMXNhaYeAKGkGSJ3b1cYdgVXW5sAhLOBrD44/zTky9OwNWgH16k
	 Jo5UdIZxQwaZ4hK312j1GbDPiwdWeM3qS83VXxhuRaYwPw4FZ+r9zvkY/TUuPe6wPo
	 uOdpEH0hKiO0DoKhZzKhFz9Q84ps6Iq9hpoWOZTw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726324AbeLQF3O (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 00:29:14 -0500
Received: from mail.kernel.org ([198.145.29.99]:54432 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbeLQF3N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 00:29:13 -0500
Received: from localhost (unknown [171.61.92.201])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 595EE2084A;
        Mon, 17 Dec 2018 05:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545024553;
        bh=ZoNaJtyPEsEUQ8dr2j1Tf7RvncxmAuS4c8L1eUOgqzE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mF10uAYYUdxlK6hBICEv/zmhdu0uelfGYAswpAJ3fqKwtkL2N+zmkIz/GaOKpw2Ee
         wJlX4JizMsT7UN56H7StGYtzqo/Wd98EdgLVsEy6U051XXupkvSxrJDcCXNU86xwlI
         ydI7lpA7F1z4leATW0ThCd6N7rHqdE6pFT1jF3oY=
Date:   Mon, 17 Dec 2018 10:59:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] dmaengine: rcar-dmac: Document R8A774C0 bindings
Message-ID: <20181217052903.GA2472@vkoul-mobl>
References: <1544732263-5859-1-git-send-email-fabrizio.castro@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1544732263-5859-1-git-send-email-fabrizio.castro@bp.renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 13-12-18, 20:17, Fabrizio Castro wrote:
> Renesas' RZ/G2E (R8A774C0) SoC has DMA controllers compatible
> with this driver, therefore document RZ/G2E specific bindings.

Applied, thanks

-- 
~Vinod
