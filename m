Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44713 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757977AbcJTJLX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Oct 2016 05:11:23 -0400
Date: Thu, 20 Oct 2016 10:55:34 +0200
From: Simon Horman <horms@verge.net.au>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] R-Car FDP: Remove SoC-specific compatible strings
Message-ID: <20161020085533.GI4612@verge.net.au>
References: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1476736143-29937-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 17, 2016 at 11:29:01PM +0300, Laurent Pinchart wrote:
> Hello,
> 
> Now that the Gen3 documentation mentions the FCP version register, it's clear
> that the SoC instance in which the FCP is integrated can be identified at
> runtime without requiring SoC-specific compatible strings.
> 
> I've tested R-Car H3 ES1.x and R-Car M3 and the results match the
> documentation, so it should be safe to use the generic compatible strings
> only.

I have queued series this up with with Geert's tags.
