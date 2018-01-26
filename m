Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [RFC PATCH v2 0/1] of: easier debugging for node life cycle
 issues
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        devicetree@vger.kernel.org,
        Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org
References: <20180121143117.19805-1-wsa+renesas@sang-engineering.com>
 <00fc90ee-de26-f819-9c81-27d06918564d@gmail.com>
 <20180125060330.781667e9@vmware.local.home>
 <a30d4cd3-0068-8cca-cc2f-ca207d0d278b@gmail.com>
 <20180125231443.44yy65ztr6exaam7@ninjato>
From: Frank Rowand <frowand.list@gmail.com>
Message-ID: <4b373579-7a86-6883-2624-12a5408bb49b@gmail.com>
Date: Thu, 25 Jan 2018 16:46:06 -0800
MIME-Version: 1.0
In-Reply-To: <20180125231443.44yy65ztr6exaam7@ninjato>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 01/25/18 15:14, Wolfram Sang wrote:
> 
>> This means that ftrace can not be used for the of_node_get(),
>> of_node_put(), and of_node_release() debug info, because
>> these functions are called before early_initcall().
> 
> For the record: You can still unbind/bind devices. This is how I
> debugged an issue.

I wasn't implying that the data wasn't usable for any use case.

The point is that using ftrace means there are use cases for the
debug information where the information will not be available.

