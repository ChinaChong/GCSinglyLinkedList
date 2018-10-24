//
//  SinglyLinkedList.m
//  OC版数据结构
//
//  Created by 崇 on 2018/10/22.
//  Copyright © 2018年 崇. All rights reserved.
//

#import "SinglyLinkedList.h"

@interface SinglyLinkedListNode : NSObject

@property (nonatomic, assign) NSInteger element;

@property (nonatomic, strong) SinglyLinkedListNode *nextNode;

@end


@implementation SinglyLinkedListNode

- (instancetype)initWithItem:(NSInteger)item {
    self = [super init];
    if (self)
    {
        self.element = item;
        return self;
    }
    
    return nil;
}

@end

@interface SinglyLinkedList()

@property (nonatomic, strong) SinglyLinkedListNode *headNode;

@end

@implementation SinglyLinkedList

- (instancetype)initWithNode:(SinglyLinkedListNode *)node {
    self = [super init];
    
    if (self)
    {
        self.headNode = node;
        return self;
    }
    
    return nil;
}

// 链表是否为空
- (BOOL)isEmpty {
    
    return self.headNode == nil;
}

// 链表长度
- (NSInteger)length {
    // cur游标(指针),用来移动遍历节点
    SinglyLinkedListNode *cur = self.headNode;
    
    // count记录数量
    NSInteger count = 0;
    
    while (cur) {
        count++;
        cur = cur.nextNode;
    }
    
    return count;
}

// 遍历链表
- (void)travel {
    // 空链表的情况
    if ([self isEmpty]) return;
    
    SinglyLinkedListNode *cur = self.headNode;
    
    while (cur) {
        NSLog(@"%ld",cur.element);
        cur = cur.nextNode;
    }
}

// 链表头部添加元素，头插法
- (void)insertNodeAtHeadWithItem:(NSInteger)item {
    SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem: item];
    
    node.nextNode = self.headNode;
    self.headNode = node;
}

// 链表尾部添加元素，尾插法
- (void)appendNodeWithItem:(NSInteger)item {
    SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem: item];
    
    if ([self isEmpty]) {
        self.headNode = node;
    }
    else {
        SinglyLinkedListNode *cur = self.headNode;
        
        while (cur.nextNode) {
            cur = cur.nextNode;
        }
        
        cur.nextNode = node;
    }
}

// 指定位置添加元素
- (void)insertNodeWithItem:(NSInteger)item atIndex:(NSInteger)index {
    
    if (index <= 0) {
        [self insertNodeAtHeadWithItem: item];
    }
    else if (index > ([self length] - 1)) {
        [self appendNodeWithItem: item];
    }
    else {
        SinglyLinkedListNode *pre = self.headNode;
        
        for (int i = 0; i < index - 1; i++) {
            pre = pre.nextNode;
        }
        
        SinglyLinkedListNode *node = [[SinglyLinkedListNode alloc] initWithItem: item];
        
        node.nextNode = pre.nextNode;
        pre.nextNode = node;
    }
}

// 删除节点
- (void)removeNodeWithItem:(NSInteger)item {
    
    SinglyLinkedListNode *cur = self.headNode;
    SinglyLinkedListNode *pre = [[SinglyLinkedListNode alloc] init];
    
    while (cur) {
        if (cur.element == item)
        {
            // 先判断此节点是否是头节点,如果是头节点
            if (cur == self.headNode)
            {
                self.headNode = cur.nextNode;
            }
            else {
                pre.nextNode = cur.nextNode;
            }
            cur = nil;
            break;
        }
        else {
            pre = cur;
            cur = cur.nextNode;
        }
    }
}

// 查找节点是否存在
- (BOOL)searchNodeWithItem:(NSInteger)item {
    SinglyLinkedListNode *cur = self.headNode;
    
    while (cur) {
        if (cur.element == item)
        {
            return YES;
        }
        else {
            cur = cur.nextNode;
        }
    }
    
    return NO;
}

@end
