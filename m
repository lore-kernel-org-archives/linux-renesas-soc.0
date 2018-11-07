Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34870 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726242AbeKGS5c (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Nov 2018 13:57:32 -0500
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so16603173wrv.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 07 Nov 2018 01:28:00 -0800 (PST)
Subject: Re: [PATCH 1/1] slimbus: qcom-ctrl: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, alsa-devel@alsa-project.org
References: <20181021200045.2053-1-wsa+renesas@sang-engineering.com>
 <20181021200045.2053-2-wsa+renesas@sang-engineering.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Message-ID: <40978484-383a-6cd8-9d4d-9b3185583b69@linaro.org>
Date: Wed, 7 Nov 2018 09:27:58 +0000
MIME-Version: 1.0
In-Reply-To: <20181021200045.2053-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 21/10/18 21:00, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> ---
Applied to slimbus tree!
