Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from icp-osb-irony-out2.external.iinet.net.au ([203.59.1.155]:10084
        "EHLO icp-osb-irony-out2.external.iinet.net.au" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726451AbeLCMa2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 3 Dec 2018 07:30:28 -0500
Subject: Re: [PATCH v6 3/6] m68k: coldfire: Add clk_get_optional() function
To: Christoph Hellwig <hch@infradead.org>
Cc: Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org
References: <20181116145937.27660-1-phil.edworthy@renesas.com>
 <20181116145937.27660-4-phil.edworthy@renesas.com>
 <bcb0278b-a4f5-068b-324f-7be3ca963102@linux-m68k.org>
 <20181129163258.GA26511@infradead.org>
From: Greg Ungerer <gerg@linux-m68k.org>
Message-ID: <0c51e641-7806-33b3-6c3e-d5ff44926a45@linux-m68k.org>
Date: Mon, 3 Dec 2018 22:29:31 +1000
MIME-Version: 1.0
In-Reply-To: <20181129163258.GA26511@infradead.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Christoph,

On 30/11/18 2:32 am, Christoph Hellwig wrote:
> On Thu, Nov 29, 2018 at 09:54:37PM +1000, Greg Ungerer wrote:
>> Hi Phil,
>>
>> On 17/11/18 12:59 am, Phil Edworthy wrote:
>>> clk_get_optional() returns NULL if not found instead of -ENOENT,
>>> otherwise the behaviour is the same as clk_get().
>>>
>>> Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
>>
>> Acked-by: Greg Ungerer <gerg@@linux-m68k.org>
>>
>> Looks good. Do you want me to take this in the m68knommu git tree?
>> Or is the whole series going through some other tree?
> 
> Any chance we could just get coldfire moved over to the common clock
> framework?

Sure, I will have a look at it.

Regards
Greg
