Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f54.google.com ([209.85.215.54]:48958 "EHLO
        mail-lf0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751696AbdJDMvb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Oct 2017 08:51:31 -0400
Received: by mail-lf0-f54.google.com with SMTP id q132so13282962lfe.5
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Oct 2017 05:51:30 -0700 (PDT)
Subject: Re: [PATCH] ata: sata_rcar: Use of_device_get_match_data() helper
To: Geert Uytterhoeven <geert+renesas@glider.be>,
        Tejun Heo <tj@kernel.org>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1507119187-12297-1-git-send-email-geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <aabae5a7-24d6-3ef5-a92f-dcddff78a8c9@cogentembedded.com>
Date: Wed, 4 Oct 2017 15:51:25 +0300
MIME-Version: 1.0
In-Reply-To: <1507119187-12297-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/04/2017 03:13 PM, Geert Uytterhoeven wrote:

> Use the of_device_get_match_data() helper instead of open coding.
> Note that the sata_rcar driver is used with DT only, so there's always a
> valid match.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
