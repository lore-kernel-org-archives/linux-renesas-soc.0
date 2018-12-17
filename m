Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37943C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:05:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07C3D2145D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545055513;
	bh=tIem/FcwwonHHnikHP3IubTY3kjP3+cny1uieqGzUng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=VwSdwn0/p2z/+6qtth3gPiYB4U6L/M2JqDp6uWayOBBood8dedsAqbRpVdPiudb3q
	 P2ZUKpONkKpD/h3JLyNoBKNyvZKBw56V16pmDTPiM8NF/IF3hd8FTFvJHAxVBADKZ5
	 ju/E+tQADiN9GjXh6PkVoJIfjpYqReIIbnoQHW4Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727068AbeLQOFM (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:05:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:35894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726673AbeLQOFM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:05:12 -0500
Received: from localhost (5356596B.cm-6-7b.dynamic.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 523052133F;
        Mon, 17 Dec 2018 14:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545055511;
        bh=tIem/FcwwonHHnikHP3IubTY3kjP3+cny1uieqGzUng=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QnErmbXp6pSnzRzAx7NckZV9JnQikVwoHBzRN+rZZ2JxKSTwVvaRTMDFMv7e8ZnMA
         mimLOAuGi6cXNV0fb60Wkml7anuH3UBt0+fD3J8JBaHafokwN4vv/crzq/gQB0Iqj8
         wpt8dTjmmtWf+fEzT4kcXsB0nRuKbyfokl28+EsQ=
Date:   Mon, 17 Dec 2018 15:05:09 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Jiri Slaby <jslaby@suse.com>, Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 0/4] serial: sh-sci: Fix fallback to PIO on DMA failure
Message-ID: <20181217140509.GA7112@kroah.com>
References: <20181213184444.21904-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181213184444.21904-1-geert+renesas@glider.be>
User-Agent: Mutt/1.11.1 (2018-12-01)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Dec 13, 2018 at 07:44:40PM +0100, Geert Uytterhoeven wrote:
> 	Hi Greg, Jiri,
> 
> When submitting a DMA request fails, the sh-sci driver is supposed to
> fall back to PIO.  However, this never really worked due to various
> reasons (sh-sci driver issues and dmaengine framework limitations).
> 
> There are three places where DMA submission can fail, and the driver
> should fall back to PIO:
>   1. sci_dma_rx_complete(),
>   2. sci_submit_rx(),
>   3. work_fn_tx().
> 
> This patch series fixes fallback to PIO in the receive path (cases 1 and
> 2).
> Fallback to PIO in the transmit path (case 3) already seems to work
> fine.
> 
> Changes compared to v3:
>   - Let sci_submit_rx() return -EAGAIN instead of -1 on failure,
>   - Check for negative error in sci_submit_rx() caller.

First 3 patches now queued up, thanks.

I'll wait for a respin or something for patch 4.

thanks,

greg k-h
