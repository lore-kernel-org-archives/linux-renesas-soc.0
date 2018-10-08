Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:38602 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725973AbeJHO57 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Oct 2018 10:57:59 -0400
Date: Mon, 8 Oct 2018 09:47:32 +0200
From: Simon Horman <horms@verge.net.au>
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] thermal: rcar_thermal: add R8A77970 support
Message-ID: <20181008074732.6fu3y5hfhsstzeii@verge.net.au>
References: <366d8e06-6164-94ff-823f-6b0d1e2d8d53@cogentembedded.com>
 <65ec6fcf-931a-a807-af1b-f204c03344f0@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65ec6fcf-931a-a807-af1b-f204c03344f0@cogentembedded.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Oct 05, 2018 at 12:03:13AM +0300, Sergei Shtylyov wrote:
> Add the R-Car V3M (R8A77970) SoC support to the R-Car gen2 thermal driver.
> The hardware is the same as in the R-Car D3 (R8A77995) plus the CIVM status
> register (we don't use).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
