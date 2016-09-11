Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f44.google.com ([209.85.215.44]:34500 "EHLO
        mail-lf0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756193AbcIKSOS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Sep 2016 14:14:18 -0400
Received: by mail-lf0-f44.google.com with SMTP id u14so74145987lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 11 Sep 2016 11:14:17 -0700 (PDT)
Subject: Re: [PATCH 23/26] sh_eth: constify local structures
To: Julia Lawall <Julia.Lawall@lip6.fr>
References: <1473599168-30561-1-git-send-email-Julia.Lawall@lip6.fr>
 <1473599168-30561-24-git-send-email-Julia.Lawall@lip6.fr>
Cc: joe@perches.com, kernel-janitors@vger.kernel.org,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cb443416-4fb9-5593-2529-66211299c9a8@cogentembedded.com>
Date: Sun, 11 Sep 2016 21:14:13 +0300
MIME-Version: 1.0
In-Reply-To: <1473599168-30561-24-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/11/2016 04:06 PM, Julia Lawall wrote:
> For structure types defined in the same file or local header files, find
> top-level static structure declarations that have the following
> properties:
> 1. Never reassigned.

   Really?

> 2. Address never taken

   Really?

> 3. Not passed to a top-level macro call
> 4. No pointer or array-typed field passed to a function or stored in a
> variable.
> Declare structures having all of these properties as const.
>
> Done using Coccinelle.
> Based on a suggestion by Joe Perches <joe@perches.com>.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

    NAK, see sh_eth_set_default_cpu_data().

MBR, Sergei
