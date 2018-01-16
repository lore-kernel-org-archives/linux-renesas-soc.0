Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:44948 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbeAPQ2X (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Jan 2018 11:28:23 -0500
Received: by mail-lf0-f42.google.com with SMTP id w23so18141169lfd.11
        for <linux-renesas-soc@vger.kernel.org>; Tue, 16 Jan 2018 08:28:22 -0800 (PST)
Subject: Re: [PATCH v2] sata: sata_rcar: Reset SATA PHY when Salvator-X board
 resumes
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-ide@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <1516113552-27701-1-git-send-email-ykaneko0929@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <5b11a280-d976-034b-90dd-1c99170a1904@cogentembedded.com>
Date: Tue, 16 Jan 2018 19:28:19 +0300
MIME-Version: 1.0
In-Reply-To: <1516113552-27701-1-git-send-email-ykaneko0929@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/16/2018 05:39 PM, Yoshihiro Kaneko wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> 
> Because power of Salvator-X board is cut off in suspend,
> it needs to reset SATA PHY state in resume.
> Otherwise, SATA partition could not be accessed anymore.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> [reinit phy in sata_rcar_resume() function on R-Car Gen3 only]
> [fixed the prefix for the subject]
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> ---
> 
> This patch is based on the for-next branch of libata tree.
> 
> v2 [Yoshihiro Kaneko]
> * reinit phy on R-Car Gen3 only as suggested by Geert Uytterhoeven
> * use "sata_rcar" prefix for the subject as suggested by Sergei Shtylyov

   And I don't think you need the redundant "sata: " prefix either...

MBR, Sergei
