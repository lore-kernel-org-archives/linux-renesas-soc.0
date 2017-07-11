Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:33503 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933863AbdGKQXo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Jul 2017 12:23:44 -0400
Received: by mail-lf0-f46.google.com with SMTP id z78so4903948lff.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 11 Jul 2017 09:23:43 -0700 (PDT)
Subject: Re: [PATCH] ata: sata_rcar: add gen[23] fallback compatibility
 strings
To: Simon Horman <horms+renesas@verge.net.au>,
        Tejun Heo <tj@kernel.org>
References: <1499773460-8930-1-git-send-email-horms+renesas@verge.net.au>
Cc: linux-ide@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <85f13b7a-0bf4-e2fa-b57c-08d002caf892@cogentembedded.com>
Date: Tue, 11 Jul 2017 19:23:40 +0300
MIME-Version: 1.0
In-Reply-To: <1499773460-8930-1-git-send-email-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/11/2017 02:44 PM, Simon Horman wrote:

> Add fallback compatibility string for R-Car Gen 2 and 3.
>
> In the case of Renesas R-Car hardware we know that there are generations of
> SoCs, e.g. Gen 1 and 2. But beyond that its not clear what the relationship
> between IP blocks might be. For example, I believe that r8a7790 is older
> than r8a7791 but that doesn't imply that the latter is a descendant of the
> former or vice versa.
>
> We can, however, by examining the documentation and behaviour of the
> hardware at run-time observe that the current driver implementation appears
> to be compatible with the IP blocks on SoCs within a given generation.
>
> For the above reasons and convenience when enabling new SoCs a
> per-generation fallback compatibility string scheme being adopted for
> drivers for Renesas SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
