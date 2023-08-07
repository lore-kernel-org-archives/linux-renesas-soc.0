Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00E4C001B0
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  7 Aug 2023 12:39:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233688AbjHGMjg (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 7 Aug 2023 08:39:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233703AbjHGMjZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 7 Aug 2023 08:39:25 -0400
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id E65931FC0
        for <linux-renesas-soc@vger.kernel.org>; Mon,  7 Aug 2023 05:38:43 -0700 (PDT)
Received: from 8bytes.org (pd9fe94eb.dip0.t-ipconnect.de [217.254.148.235])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.8bytes.org (Postfix) with ESMTPSA id 3930A2802BA;
        Mon,  7 Aug 2023 14:38:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
        s=default; t=1691411891;
        bh=zgStjqrHXymFycSwbO5NCs1NsB4Ai/SbJR1ziFTMpt8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dkgx2aSc0eZuHjJK98+sPhnqVw/fg2b6hm1G9v/5JH0V8rbksLJ9mmWWB/GysxD3N
         BGOBR56VSISEytRrkdK2z38j3dHYL/jHqS4esw6yEYcrhckA5qOoF59JL7d9+6vkqh
         IUD1pv0Jsk7Y1UZpo+Y5C9+v60l8FII8oUzg7T/xqC286PR8nf0ofxTBit0L3/EFY+
         4zaTP0JIU0KRqoY1yXPSmdftJkiuCSepTu3iuk+ftByXsf+3HmxSZ/UrWTeJIIfNpR
         /WH4ZdlMUDMllg8h5+q2Nf5CN3rRbRr0gyesO9fYtNMPDQ9Wy98sEXLYPJYZXD69GR
         n4R0MsbvEPnEQ==
Date:   Mon, 7 Aug 2023 14:38:10 +0200
From:   Joerg Roedel <joro@8bytes.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     will@kernel.org, robin.murphy@arm.com, iommu@lists.linux.dev,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4] iommu/ipmmu-vmsa: Allow PCIe devices
Message-ID: <ZNDlsnyLFkBAOJcD@8bytes.org>
References: <20230728014659.411751-1-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230728014659.411751-1-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jul 28, 2023 at 10:46:59AM +0900, Yoshihiro Shimoda wrote:
>  drivers/iommu/ipmmu-vmsa.c | 5 +++++
>  1 file changed, 5 insertions(+)

Applied, thanks.
