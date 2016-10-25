Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from www1246.sakura.ne.jp ([219.94.162.56]:59888 "EHLO
        www1246.sakura.ne.jp" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757168AbcJYCHG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 24 Oct 2016 22:07:06 -0400
Subject: Re: The failure summary report of GEN2 for linux stable v4.8
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <57A46D20.7040106@jinso.co.jp> <57C9764F.2070802@jinso.co.jp>
 <f2bb791e-8973-10a9-a2ac-1a944b38d4ad@jinso.co.jp>
 <9d9a647b-d75f-e89a-2d4d-55e409ccabae@jinso.co.jp>
 <580620CD.50703@sang-engineering.com>
 <b7e9b4c2-1d5d-2e76-c0f4-fcc50150dc30@jinso.co.jp>
 <CAMuHMdWuHZ=5ogTE9rG=hjJxVn4dADc_cXuEcO76goq8KDf9kg@mail.gmail.com>
 <125b4831-cbdf-f8e1-da97-8ea9cf458c22@jinso.co.jp>
 <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
Cc: Wolfram Sang <wsa@sang-engineering.com>,
        duclm <lm-duc@jinso.co.jp>,
        Ryusuke Sakato <ryusuke.sakato.bx@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        =?UTF-8?B?56iy5ZCJ?= <h-inayoshi@jinso.co.jp>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        =?UTF-8?B?RHVuZ++8muS6uuOCvQ==?= <nv-dung@jinso.co.jp>,
        Cao Minh Hiep <cm-hiep@jinso.co.jp>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?= <niklas.soderlund@ragnatech.se>
From: Xuan Truong Nguyen <nx-truong@jinso.co.jp>
Message-ID: <7868deaa-3310-8a73-5d12-2f66b3b584a1@jinso.co.jp>
Date: Tue, 25 Oct 2016 11:07:00 +0900
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU1-+AqnQpQPrsSxD0tQpjaeEPxiawULTJaUFsGO2Kc1A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>


Hi Geert
> That looks like a race condition between timeout handling and actual completion
> of the DMA?
Sorry, I don't know exactly what you mean.
We use the baudrate of 38400 for all. (ttySC0, ttySC1,ttyUSB0,ttyUSB1).
The transfer works normally for a while before the warning message is 
output.

Thanks and best regards
JINSO/Truong
