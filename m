Return-Path: <SRS0=rhqV=A7=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31E1C43445
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Jul 2020 06:36:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EB1020709
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 20 Jul 2020 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595227005;
	bh=G8QKIIPp5D4K8kA/4r2aQzDTcpoqiOLy2Z0bz9pLapc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rSUu75tGXc4dDXQG+XUFjJa/vzPOsyJy+3Rh7RFX/f6VADS/wE+CdFcPeHHdoxQ8p
	 49bjB5upzFtSweTVkrTuxnbCYCLAIKXRtwbFs0NZM6VoaBbaXqJQk1hAHzA30wvUvu
	 9DFuhbJ7dxvTfhQ8ah8eta7/a65ge+IE1s3Hh6+8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgGTGga (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 20 Jul 2020 02:36:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53808 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726084AbgGTGg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 20 Jul 2020 02:36:29 -0400
Received: from localhost (unknown [122.171.202.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C195920709;
        Mon, 20 Jul 2020 06:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595226988;
        bh=G8QKIIPp5D4K8kA/4r2aQzDTcpoqiOLy2Z0bz9pLapc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=nBFRWN4wCbNdNNdFP/mf6w4VUKv5HBcMFBn5nomZjwH+fumLcehyvFrJ6jH9JQvHR
         JxFsvy4D00XgAwF0QS/XApUT+dv74ujDXrAukRJo3IeT3yyY2TpWTHco5oBmJ9MuDz
         1+QKf3jQpAbOuSmZbWpaisjBmBLnXMbycc7bj4oQ=
Date:   Mon, 20 Jul 2020 12:06:25 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Jens Axboe <axboe@kernel.dk>, Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Mark Brown <broonie@kernel.org>,
        Niklas <niklas.soderlund@ragnatech.se>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        devicetree@vger.kernel.org, linux-ide@vger.kernel.org,
        dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
        linux-renesas-soc@vger.kernel.org, linux-usb@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>
Subject: Re: [PATCH 12/20] dt-bindings: dma: renesas,usb-dmac: Add binding
 for r8a774e1
Message-ID: <20200720063625.GG12965@vkoul-mobl>
References: <1594919915-5225-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594919915-5225-13-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 16-07-20, 18:18, Lad Prabhakar wrote:
> Add binding for R8A774E1 SoC (RZ/G2H).

Applied, thanks

-- 
~Vinod
