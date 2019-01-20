Return-Path: <SRS0=JlVY=P4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCEFC61CE4
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Jan 2019 11:01:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3175C2087B
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Jan 2019 11:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547982101;
	bh=aV0jcf8MsROMIVI6IiliU5PTJnS5R90uCgGUVtBSZVc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GlxEOMWatFrXSqRt5W0UAFY2/3VFHx7Tpv0aPCDg+iludPL3N5axt4/hCF3T8m2LX
	 47eUeMXM1E7mR1aBjnm4ndukOh4PxnKdxVrGEmr0G1bJKxHWjtFFU8IP5aJnHtqrtP
	 aPg4AC2mH6IR0kERcbvFBDD0TjP8b3JRR9szkmDw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728894AbfATLBk (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 20 Jan 2019 06:01:40 -0500
Received: from mail.kernel.org ([198.145.29.99]:52160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728781AbfATLBk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jan 2019 06:01:40 -0500
Received: from localhost (unknown [122.178.235.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4A92B2084F;
        Sun, 20 Jan 2019 11:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1547982100;
        bh=aV0jcf8MsROMIVI6IiliU5PTJnS5R90uCgGUVtBSZVc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Af1mNeehsmQp6xf2UCMYHlz0408ub5+flve2bjMuu4TjHEN7QlRmIWKAtEEyyONWC
         WSdFkp3G4qyEi+ze1Q7nRXoWCabfXkakmR1uvBvgXXpWhszprCbp52YJLheU5nCsoz
         aRdg1IQihmDofEKUmAbG1mBO0X78hBacg9mxb2Dc=
Date:   Sun, 20 Jan 2019 16:30:06 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     dmaengine@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        stable@vger.kernel.org,
        Phuong Nguyen <phuong.nguyen.xw@renesas.com>
Subject: Re: [PATCH v2] dmaengine: usb-dmac: Make DMAC system sleep callbacks
 explicit
Message-ID: <20190120110006.GR4635@vkoul-mobl>
References: <1547714657-22780-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547714657-22780-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 17-01-19, 17:44, Yoshihiro Shimoda wrote:
> From: Phuong Nguyen <phuong.nguyen.xw@renesas.com>
> 
> This commit fixes the issue that USB-DMAC hangs silently after system
> resumes on R-Car Gen3 hence renesas_usbhs will not work correctly
> when using USB-DMAC for bulk transfer e.g. ethernet or serial
> gadgets.
> 
> The issue can be reproduced by these steps:
>  1. modprobe g_serial
>  2. Suspend and resume system.
>  3. connect a usb cable to host side
>  4. Transfer data from Host to Target
>  5. cat /dev/ttyGS0 (Target side)
>  6. echo "test" > /dev/ttyACM0 (Host side)
> 
> The 'cat' will not result anything. However, system still can work
> normally.
> 
> Currently, USB-DMAC driver does not have system sleep callbacks hence
> this driver relies on the PM core to force runtime suspend/resume to
> suspend and reinitialize USB-DMAC during system resume. After
> the commit 17218e0092f8 ("PM / genpd: Stop/start devices without
> pm_runtime_force_suspend/resume()"), PM core will not force
> runtime suspend/resume anymore so this issue happens.
> 
> To solve this, make system suspend resume explicit by using
> pm_runtime_force_{suspend,resume}() as the system sleep callbacks.
> SET_NOIRQ_SYSTEM_SLEEP_PM_OPS() is used to make sure USB-DMAC
> suspended after and initialized before renesas_usbhs."

Applied, thanks

-- 
~Vinod
