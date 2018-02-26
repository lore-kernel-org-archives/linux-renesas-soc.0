Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:36277 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752226AbeBZP4n (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Feb 2018 10:56:43 -0500
Received: by mail-lf0-f42.google.com with SMTP id g72so3509899lfg.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 26 Feb 2018 07:56:43 -0800 (PST)
Subject: Re: [PATCH net-next] sh_eth: fix TSU init on SH7734/R8A7740
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Cc: linux-renesas-soc@vger.kernel.org
References: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
Message-ID: <e8b97fb0-c4fb-6ba2-8cf3-3064ab2ef273@cogentembedded.com>
Date: Mon, 26 Feb 2018 18:56:40 +0300
MIME-Version: 1.0
In-Reply-To: <9fc53eac-5513-00be-2430-ceb4b6f57e9b@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 02/24/2018 10:41 PM, Sergei Shtylyov wrote:

> It appears that the single port Ether controllers having TSU (like SH7734/
> R8A7740) need the same kind of treating in sh_eth_tsu_init() as R7S72100
> currently has -- they also don't have the TSU registers related e.g. to
> passing the frames between ports. Add the 'sh_eth_cpu_data::dual_port'
> flag and use it as a new criterion for taking a "short path" in the TSU
> init sequence in order to avoid writing to the non-existant registers...

   Spell checker tells it should have been "non-existent" -- would it be possible
to fix while merging?

> Fixes: f0e81fecd4f8 ("net: sh_eth: Add support SH7734")
> Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
[...]

MBR, Sergei
