Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f41.google.com ([209.85.215.41]:36113 "EHLO
        mail-lf0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932472AbdHVMDl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Aug 2017 08:03:41 -0400
Received: by mail-lf0-f41.google.com with SMTP id l137so3070690lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Aug 2017 05:03:40 -0700 (PDT)
Subject: Re: [PATCH] ravb: make mdiobb_ops const
To: Bhumika Goyal <bhumirks@gmail.com>, julia.lawall@lip6.fr,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1503389282-17369-1-git-send-email-bhumirks@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <1f074a7c-0d3a-e569-4400-c50d967e550c@cogentembedded.com>
Date: Tue, 22 Aug 2017 15:03:37 +0300
MIME-Version: 1.0
In-Reply-To: <1503389282-17369-1-git-send-email-bhumirks@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 08/22/2017 11:08 AM, Bhumika Goyal wrote:

> Make these const as they are only stored in a const field of a
> mdiobb_ctrl structure.

> Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> ---
>   drivers/net/ethernet/renesas/ravb_main.c | 2 +-
>   drivers/net/ethernet/renesas/sh_eth.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)

    If you're fixing both Renesas drivers at once, your subject should be 
"renesas: make mdiobb_ops const". With that fixed, you have my:

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
