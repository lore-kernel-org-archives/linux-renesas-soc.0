Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ed1-f44.google.com ([209.85.208.44]:41387 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728993AbeJWHDp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 23 Oct 2018 03:03:45 -0400
Date: Mon, 22 Oct 2018 15:43:11 -0700
From: Richard Cochran <richardcochran@gmail.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH 1/1] ptp: ptp_dte: simplify getting .driver_data
Message-ID: <20181022224311.xpzs6piq5khgg3t5@localhost>
References: <20181021200039.1933-1-wsa+renesas@sang-engineering.com>
 <20181021200039.1933-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021200039.1933-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 10:00:39PM +0200, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.

Acked-by: Richard Cochran <richardcochran@gmail.com>
