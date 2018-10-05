Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi1-f196.google.com ([209.85.167.196]:35836 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727968AbeJEVWS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 5 Oct 2018 17:22:18 -0400
Received: by mail-oi1-f196.google.com with SMTP id 22-v6so9536669oiz.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 05 Oct 2018 07:23:21 -0700 (PDT)
Date: Fri, 5 Oct 2018 09:23:18 -0500
From: Andy Gross <andy.gross@linaro.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        David Brown <david.brown@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 06/12] i2c: qup: use core to detect 'no zero length' quirk
Message-ID: <20181005142318.GA15665@hector.nxp.com>
References: <20180723202617.15230-1-wsa+renesas@sang-engineering.com>
 <20180723202617.15230-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180723202617.15230-7-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 23, 2018 at 10:26:10PM +0200, Wolfram Sang wrote:
> And don't reimplement in the driver.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Reviewed-by: Andy Gross <andy.gross@linaro.org>
