Return-Path: <SRS0=gCEL=YH=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EDDBC4CECE
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Oct 2019 06:58:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0857420854
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 14 Oct 2019 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1571036288;
	bh=j+ZrsNnjof4PoEK/2IEQvlBYczLMVw1tpD+JZhWdrVU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=DXDxiFm5K8+VIwar+tystzxE0oRShy91CXtULDq5k2TN/WVRJjEjWR68zLH7mWnGb
	 f2EVE+O5ki9oGZMIE8AA9vCqDRBrJnBwUbjiHWc1hczcJVtaSujlFXHpdE+fDv12ij
	 7Ar2QUF35yIzbqHx5jM4NkyvkjAJs3SwuAh51/Qg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730078AbfJNG6H (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 14 Oct 2019 02:58:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58696 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730080AbfJNG6H (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Oct 2019 02:58:07 -0400
Received: from localhost (unknown [122.167.124.160])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 43C2220673;
        Mon, 14 Oct 2019 06:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571036287;
        bh=j+ZrsNnjof4PoEK/2IEQvlBYczLMVw1tpD+JZhWdrVU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wb2Z2KvHPcPM22VfNaSIPzAcvAqngWNI2/BVZI5JOc2bSKao6YsK+xPhydVnTRiWl
         fP+cRr4vCnwyAczxLIchLLL6HxM/IOdw3oBpGrl0/S1XI7WEjAlsb+MAl+nPgr07cs
         VxqoAMY+oMhL1e4cQRd2vCxFYF+K6d5wZOflOx5Y=
Date:   Mon, 14 Oct 2019 12:28:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     vinod.koul@intel.com, dmaengine@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] dmaengine: rcar-dmac: use of_data and add
 dma-channel-mask support
Message-ID: <20191014065802.GA2654@vkoul-mobl>
References: <1568010892-17606-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1568010892-17606-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 09-09-19, 15:34, Yoshihiro Shimoda wrote:
> This patch series is based on the latest slave-dma.git / next branch.
> 
> Changes from v2:
>  - Rebase the latest slave-dma.git / next branch (In other words,
>    this patch series doesn't depend any other branches.
>  - Cherry-picked a patch which is contained in v5.3-rc8 to solve any
>    dependency. (I'm not sure whether this is a right way or not...)
>   https://patchwork.kernel.org/project/linux-renesas-soc/list/?series=169317

Sorry for delay, I was on vacation + conference. Yeah ideally I would
merge fixes and this wouldn't be the case.

patch1 is no longer needed now, I have applied the rest

Thanks
-- 
~Vinod
