Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35741 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753646AbeDZX3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 26 Apr 2018 19:29:35 -0400
Subject: Re: [PATCH 04/61] bus: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Brian Norris <computersforpeace@gmail.com>,
        Gregory Fong <gregory.0xf0@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-5-wsa+renesas@sang-engineering.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <11bc8504-d32a-36fc-0a51-569fff3c4ee2@gmail.com>
Date: Thu, 26 Apr 2018 16:29:29 -0700
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 04/19/2018 07:05 AM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Looks reasonable, would you want to use dev_set_drvdata() while we are
it? That would bring more consistency given your proposed change.

Thanks!
-- 
-- 
Florian
