Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 800F0C54EBE
	for <linux-renesas-soc@archiver.kernel.org>; Thu, 12 Jan 2023 18:58:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230124AbjALS6G (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Thu, 12 Jan 2023 13:58:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234994AbjALS50 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 12 Jan 2023 13:57:26 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BCEDDD2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 10:30:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id BC05962134
        for <linux-renesas-soc@vger.kernel.org>; Thu, 12 Jan 2023 18:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E2DDC433D2;
        Thu, 12 Jan 2023 18:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673548253;
        bh=7uf+hF39dXcAFsmki70X9UrlNOJ3T70aU67vceBY06A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hz+UVIZaywf+6IghuIMxQQ7TJ7uJrAWQlRP4qoAUaeoVWtzODnrQWBDWnMHh3Ws3U
         BZGqXWvDCamzfiWVZhrhjDSnkaOpJx2r39GnkX9hRYnh/C3mxV3IpVoFaRLHe3dVJ+
         2N1GUryPsriR65oi52DrviIGzMITfForwdABu1EjB9RHQ/S1t0+rwlKNL1XVzoHaAu
         ywzJMPtyQ+WLyVlDzywXUQ7UV09UvGLRHdxoS6Pl+IDEOzwLo8XoexB+dM7xcjBGsa
         dcNNz4B4TLR2TDFFWRCgs9WybB09P2yf+pd+iRH7oNVCtgI4FSJ75sBhv4viMHmAR4
         O0n3bOPbc3lnw==
Date:   Fri, 13 Jan 2023 00:00:17 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     kishon@kernel.org, linux-phy@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] phy: renesas: r8a779f0-eth-serdes: Fix register setting
Message-ID: <Y8BRuYeo+MPLO+6r@matsya>
References: <20221226064216.3895421-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221226064216.3895421-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 26-12-22, 15:42, Yoshihiro Shimoda wrote:
> Fix register setting which is typo in r8a779f0_eth_serdes_chan_setting().

Applied, thanks

-- 
~Vinod
