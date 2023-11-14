Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B385DC4332F
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 14 Nov 2023 22:10:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbjKNWKF (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 14 Nov 2023 17:10:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjKNWKC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 14 Nov 2023 17:10:02 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B221D5
        for <linux-renesas-soc@vger.kernel.org>; Tue, 14 Nov 2023 14:09:59 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57876C433C8;
        Tue, 14 Nov 2023 22:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699999799;
        bh=DnWTo6FpqVWKC3zytTTU/5aOouys1eDiIwq/Iah5HMU=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uoqU4DaUOfRIXk3+JqeO9u9dluJ2NOomuxsEMkaRKTVGj+1h4kjyta8wev3xfPMj4
         E3t6B7k5jDtRfcosv7BzhcjRivjcvpPX8VeCyytRM6EY7Obb878WGwgLumG22a758b
         +lXISUeUAzL7lDK/KLzntJzfmXpTfBP1TGj79ngY6ptUkTybNNOKiGD5LpsDJPGAcf
         FvCmXGH0AQg1nZLwqPMNx+pv8xu9AjaPdkXmg96SK2iBm8ZLiE/tsXC9Je94YCF+Z/
         aZJL0nqYBAWtWFhoB8JFaTnq5uKqrChLm68dbdWFSXoFi2dr68jiaYRO6zqNMAKDIf
         YG0We6tElENQQ==
Date:   Tue, 14 Nov 2023 17:09:56 -0500
From:   Jakub Kicinski <kuba@kernel.org>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     "s.shtylyov@omp.ru" <s.shtylyov@omp.ru>,
        "davem@davemloft.net" <davem@davemloft.net>,
        "edumazet@google.com" <edumazet@google.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH net v2] ravb: Fix races between ravb_tx_timeout_work()
 and net related ops
Message-ID: <20231114170956.7bddff5b@kernel.org>
In-Reply-To: <TYBPR01MB534172F049F8072E3F77AC25D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
References: <20231019113308.1133944-1-yoshihiro.shimoda.uh@renesas.com>
        <TYBPR01MB534172F049F8072E3F77AC25D8B2A@TYBPR01MB5341.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Tue, 14 Nov 2023 08:52:29 +0000 Yoshihiro Shimoda wrote:
> Gentle ping. I confirmed that I could apply this patch on
> the latest net.git / main branch.

At a glance the suggestion from Sergei makes sense.
You need to reply to him.
