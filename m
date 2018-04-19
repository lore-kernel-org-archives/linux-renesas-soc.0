Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:38934 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753628AbeDSQWh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 12:22:37 -0400
Received: by mail-lf0-f68.google.com with SMTP id p142-v6so1019190lfd.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 19 Apr 2018 09:22:36 -0700 (PDT)
Subject: Re: [PATCH 02/61] ata: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tejun Heo <tj@kernel.org>, linux-ide@vger.kernel.org
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-3-wsa+renesas@sang-engineering.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <c486565a-d3f3-2ce0-eca2-3aa60a6c99b2@cogentembedded.com>
Date: Thu, 19 Apr 2018 19:22:33 +0300
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 04/19/2018 05:05 PM, Wolfram Sang wrote:

> We should get drvdata from struct device directly. Going via

  Note that the name of the field in the 'struct device' is driver_data,
not drvdata. Otherwise the patch looks good.

> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
[...]

MBR, Sergei
