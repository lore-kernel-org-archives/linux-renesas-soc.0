Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f48.google.com ([209.85.215.48]:39177 "EHLO
        mail-lf0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbdL3K2W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 30 Dec 2017 05:28:22 -0500
Received: by mail-lf0-f48.google.com with SMTP id m20so36967215lfi.6
        for <linux-renesas-soc@vger.kernel.org>; Sat, 30 Dec 2017 02:28:22 -0800 (PST)
Subject: Re: [PATCH] sata: rcar_sata: Reset SATA PHY when Salvator-X board
 resumes
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>, linux-ide@vger.kernel.org
Cc: Tejun Heo <tj@kernel.org>, Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-renesas-soc@vger.kernel.org
References: <1512585925-4251-1-git-send-email-ykaneko0929@gmail.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <cc623a4c-86fd-8437-a2f5-b7d15e5651ee@cogentembedded.com>
Date: Sat, 30 Dec 2017 13:28:19 +0300
MIME-Version: 1.0
In-Reply-To: <1512585925-4251-1-git-send-email-ykaneko0929@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/6/2017 9:45 PM, Yoshihiro Kaneko wrote:

> From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>

    Please use "sata_rcar: " prefix for the subject.

> Because power of Salvator-X board is cut off in suspend,
> it needs to reset SATA PHY state in resume.
> Otherwise, SATA partition could not be accessed anymore.
> 
> Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
> Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
[...]

MBR, Sergei
