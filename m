Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:33281 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753233AbcJSCp0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Oct 2016 22:45:26 -0400
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <57A46D20.7040106@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
 <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <1557504.I3EyWl6QE0@avalon>
Cc: duclm <lm-duc@jinso.co.jp>, ryusuke.sakato.bx@renesas.com,
        kuninori.morimoto.gx@renesas.com, magnus.damm@gmail.com,
        geert+renesas@glider.be, h-inayoshi@jinso.co.jp,
        yoshihiro.shimoda.uh@renesas.com, nv-dung@jinso.co.jp,
        cm-hiep@jinso.co.jp, laurent.pinchart+renesas@ideasonboard.com,
        horms+renesas@verge.net.au, linux-renesas-soc@vger.kernel.org,
        wsa@sang-engineering.com
From: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Message-ID: <46496c8e-b30a-4339-ab52-a5cf2909baff@jinso.co.jp>
Date: Wed, 19 Oct 2016 11:39:58 +0900
MIME-Version: 1.0
In-Reply-To: <1557504.I3EyWl6QE0@avalon>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello Laurent


> The document mentions that you have used shmobile_defconfig. However, that
> configuration in v4.8 doesn't enable CONFIG_CMA, which causes at least the DU
> driver to fail probing the device. I thus assume you have modified the
> configuration to enable CMA. The fact that shmobile_defconfig doesn't include
> the uvcvideo driver used by test 14 seems to confirm local modifications to
> the configuration.
We will retest it and report again.

> It would be useful to attach the kernel .config file to future reports to help
> reproducing the test failures with the exact same configuration.
Thank you.  we will attach the configs file for each issue next time.


> By the way, while at it, your e-mails are filtered out by the vger.kernel.org
> server as they contain HTML. If you could send future reports without HTML it
> would help them reaching the mailing list archive (although the presence of an
> attachment might not be appreciated by vger.kernel.org, I'm not sure about
> that).
Thanks for your info. next time I will notice that.

> Issue 11 ("VSP1：error message appears on initilization") has been introduced
> in
Sorry about this. We will add more info in the detail (like Issue 10)

For Issue 14, if you need any information to debug, please lets us know.

thanks and best regards.
truong
