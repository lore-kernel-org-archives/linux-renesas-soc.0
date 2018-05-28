Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:56592 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932142AbeE1J2B (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:28:01 -0400
Date: Mon, 28 May 2018 11:27:57 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] arm: dts: salvator-x(s): increase I2C ch4 bus speed
Message-ID: <20180528092757.cze3ngodcb2csthf@verge.net.au>
References: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180525110542.10620-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, May 25, 2018 at 01:05:40PM +0200, Wolfram Sang wrote:
> Patches taken from the BSP. I did some testing by accessing the chips manually.
> I also checked the datasheets of the attached I2C clients which confirm this
> step up.

Hi Wolfram,

Given Olof Johansson's recent comments in ("Re: [GIT PULL] Renesas ARM64
Based SoC DT Updates for v4.18") please consider squashing this
series into a single patch and posting a v2.
