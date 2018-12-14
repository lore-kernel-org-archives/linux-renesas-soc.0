Return-Path: <SRS0=qJci=OX=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BBE8C43612
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 21:44:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 39FAE208C2
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 14 Dec 2018 21:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544823888;
	bh=lYfD3fYFw3YEkcUHTx807/PU2YoiDiZoyhXWz7nMXuE=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=Iph6zrQOiCApqMf84ipruy0GJJbELdkrXOOVxKgyk5FU7NbCWf3jUfo79A0fft8KN
	 AklLJwx2+UjEUQJB/DP5VbSv+wF/N+NKbYLJAAWzYdCZy7FEemTn23LSdNAzq/sSit
	 eXP/D234l+OI+5salTFFS3kAnNN0r5cC6KQ3i4Ts=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730956AbeLNVor (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 16:44:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:45714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730952AbeLNVor (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 16:44:47 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C501C2086D;
        Fri, 14 Dec 2018 21:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1544823886;
        bh=lYfD3fYFw3YEkcUHTx807/PU2YoiDiZoyhXWz7nMXuE=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=rsZiR/kfd5wPFCiAisssFYgCUBVMKlJwD5H/HLyi0DNXQoIRTVg3DXJOpC0u+t7db
         usJL8Lmuu129mAafMAsRDqRzxgwSaGh+kbmqMWa2GieBOXr8LJ2mz3IVKgwxpZxoAY
         Wxv0VPtcxqxBaG/Mdm3I5g3LGqxQeOdvng2uvjmI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181213161528.20318-1-marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3] clk: vc5: Add suspend/resume support
To:     Marek Vasut <marek.vasut@gmail.com>, linux-clk@vger.kernel.org
References: <20181213161528.20318-1-marek.vasut+renesas@gmail.com>
Message-ID: <154482388569.19322.14148018432459812367@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Alexey Firago <alexey_firago@mentor.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
Date:   Fri, 14 Dec 2018 13:44:45 -0800
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Quoting Marek Vasut (2018-12-13 08:15:28)
> Add simple suspend/resume handlers to the driver to restore the chip
> configuration after resume. It is possible that the chip was configured
> with non-default values before suspend-resume cycle and that the chip
> is powered down during this cycle, so the configuration could get lost.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Alexey Firago <alexey_firago@mentor.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: linux-renesas-soc@vger.kernel.org
> ---

Applied to clk-next

